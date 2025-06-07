
#!/usr/bin/env python3
import sysv_ipc
import signal
import sys
import time
import numpy as np
import os
import wave
import logging

import tensorflow as tf
from tensorflow.keras.models import load_model
try:
    from tensorflow.python.compiler.tensorrt import trt_convert as trt
except ImportError:
    trt = None

from gammatone.gtgram import gtgram as cpu_gtgram
from config.config_manager import ConfigManager

# --- Configuration ---
config = ConfigManager()
FRAME_RATE    = config.get("PREPROCESS.FRAME_RATE")
WINDOW_TIME   = config.get("PREPROCESS.GAMMA.WINDOW_TIME")
HOP_TIME      = config.get("PREPROCESS.GAMMA.HOP_TIME")
CHANNELS      = config.get("PREPROCESS.GAMMA.CHANNELS")
F_MIN         = config.get("PREPROCESS.GAMMA.F_MIN")
MODEL_PATH    = config.get("REALTIME.MODEL_PATH") + "/saved_model/vq_vae"
MIN_VAL       = config.get("REALTIME.MIN")
MAX_VAL       = config.get("REALTIME.MAX")
USE_TF_GAMMA  = config.get("PREPROCESS.USE_TF_GTGRAM")
USE_TRT       = config.get("DEVICE.USE_TENSORRT")
TRT_MODEL     = config.get("REALTIME.TRT_MODEL_PATH")
MANUAL_THRES  = config.get("REALTIME.MANUAL_THRESHOLD")
SHM_KEY       = 0x1234
SEM_KEY       = 0x5678
SHM_SIZE      = 176400  # bytes
EXCEED_LIMIT  = 1

# --- Logging Setup ---
log_dir = config.get("REALTIME.LOG_PATH", "./logs")
os.makedirs(log_dir, exist_ok=True)
logging.basicConfig(
    filename=os.path.join(log_dir, "processing_time.log"),
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)
logger.info("Starting inference with config: %s", config.config)

# --- Model Loading ---
def load_inference_model():
    if USE_TRT and trt is not None:
        try:
            if TRT_MODEL and os.path.exists(TRT_MODEL):
                saved = tf.saved_model.load(TRT_MODEL)
                infer_fn = saved.signatures['serving_default']
            else:
                converter = trt.TrtGraphConverterV2(input_saved_model_dir=MODEL_PATH)
                converter.convert()
                if TRT_MODEL:
                    converter.save(TRT_MODEL)
                    saved = tf.saved_model.load(TRT_MODEL)
                else:
                    saved = converter.convert()
                infer_fn = saved.signatures.get('serving_default', saved)
            return lambda x: infer_fn(tf.convert_to_tensor(x))[list(infer_fn.outputs)[0].name].numpy()
        except Exception as e:
            logger.error("TRT conversion failed: %s, fallback to standard Keras model", e)
    model = load_model(MODEL_PATH)
    return lambda x: model.predict(x, verbose=0)

run_model = load_inference_model()

# --- GPU Path Graph ---
@tf.function
def infer_mse_graph(audio_int16):
    def _cpu_gtgram(x: np.ndarray) -> np.ndarray:
        g = cpu_gtgram(x, FRAME_RATE, WINDOW_TIME, HOP_TIME, CHANNELS, F_MIN)
        return g.astype(np.float32)
    gtg = tf.numpy_function(_cpu_gtgram, [audio_int16], tf.float32)

    db = 20.0 * tf.math.log(gtg + 1e-10) / tf.math.log(10.0)
    norm = tf.clip_by_value((db - MIN_VAL) / (MAX_VAL - MIN_VAL), 0.0, 1.0)
    inp = tf.reshape(norm, [1, CHANNELS, tf.shape(norm)[1], 1])

    def _model_pred(x: np.ndarray) -> np.ndarray:
        p = run_model(x)
        return p.astype(np.float32)
    pred = tf.numpy_function(_model_pred, [inp], tf.float32)

    mse = tf.reduce_mean(tf.square(inp - pred))
    return mse

# --- CPU Path ---
def predict_mse_cpu(audio: np.ndarray) -> float:
    gtg = cpu_gtgram(audio, FRAME_RATE, WINDOW_TIME, HOP_TIME, CHANNELS, F_MIN)
    db = 20.0 * np.log10(gtg + 1e-10)
    norm = np.clip((db - MIN_VAL) / (MAX_VAL - MIN_VAL), 0.0, 1.0)
    inp = norm.reshape(1, CHANNELS, norm.shape[1], 1)
    pred = run_model(inp)
    return float(np.mean((inp - pred) ** 2))

# --- Initialize predictor once ---
if USE_TF_GAMMA:
    predict_mse = lambda arr: float(infer_mse_graph(tf.convert_to_tensor(arr, dtype=tf.int16)).numpy())
else:
    predict_mse = predict_mse_cpu

# --- Shared Memory & Semaphore ---
shm = None
sem = None

def cleanup():
    global shm
    if shm:
        try:
            shm.detach()
            logger.info("Shared memory detached.")
        except Exception as e:
            logger.error("Detach failed: %s", e)

def signal_handler(sig, frame):
    logger.info("Signal %d received, exiting.", sig)
    cleanup()
    sys.exit(0)

# --- Wait for shared memory ---
def wait_for_shared_memory():
    global shm, sem
    while True:
        try:
            shm = sysv_ipc.SharedMemory(SHM_KEY)
            logger.info("Connected to shared memory.")
            break
        except sysv_ipc.ExistentialError:
            time.sleep(1)
    while True:
        try:
            sem = sysv_ipc.Semaphore(SEM_KEY)
            logger.info("Connected to semaphore.")
            break
        except sysv_ipc.ExistentialError:
            time.sleep(1)

# --- Processing Loops ---
def process_realtime():
    cycle = 2.0
    last = time.time()
    while True:
        start_time = time.time()
        # ensure 2-sec cycle
        if time.time() - last < cycle:
            time.sleep(cycle - (time.time() - last))
        last = time.time()

        sem.acquire()
        raw = shm.read(SHM_SIZE)
        sem.release()

        audio = np.frombuffer(raw, dtype=np.int16)
        mse = predict_mse(audio)
        if mse > MANUAL_THRES:
            print("Anomaly detected!", flush=True)
        print(mse, flush=True)

        end_time = time.time()
        logger.info("Processing time: %.6f seconds and Pred: %.6f", end_time - start_time, mse)


def process_folder(path: str):
    files = sorted(f for f in os.listdir(path) if f.endswith('.wav'))
    exceed = 0
    for f in files:
        start_time = time.time()
        filepath = os.path.join(path, f)
        with wave.open(filepath, 'rb') as wf:
            audio = np.frombuffer(wf.readframes(wf.getnframes()), dtype=np.int16)

        mse = predict_mse(audio)
        if mse > MANUAL_THRES:
            exceed += 1
        else:
            exceed = 0
        if exceed > EXCEED_LIMIT:
            print("Anomaly detected!", flush=True)
            exceed = 0
        print(mse, flush=True)

        end_time = time.time()
        logger.info("Processing time for %s: %.6f seconds and Pred: %.6f", f, end_time - start_time, mse)

# --- Main ---
def main():
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    if not config.get("REALTIME.IMPORT_FILE"):
        wait_for_shared_memory()
        process_realtime()
    else:
        process_folder(config.get("REALTIME.FOLDER_PATH"))

if __name__ == '__main__':
    main()
