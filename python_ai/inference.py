#!/usr/bin/env python3
"""
Real‑time audio anomaly detection — compare two models:
    • Plain TensorFlow SavedModel / Keras (FP32)
    • TensorRT engine (.engine, FP16)
Switch on/off via DEVICE.COMPARE_MODELS in config.yaml.
Handles dynamic batch and falls back if pinned memory allocation fails.
"""

import os
import sys
import time
import wave
import signal
import logging
import numpy as np
import sysv_ipc

# -- TensorFlow (plain model) --
import tensorflow as tf  # noqa: E402
from tensorflow.keras.models import load_model  # noqa: E402

# -- TensorRT runtime (optimised engine) --
import tensorrt as trt  # noqa: E402
import pycuda.driver as cuda  # noqa: E402
import pycuda.autoinit  # noqa: E402

# -- Local modules --
from gammatone.gtgram import gtgram as cpu_gtgram  # type: ignore
from config.config_manager import ConfigManager  # noqa: E402

# ============================================================
# 1 | Configuration & logging
# ============================================================
config = ConfigManager()

FRAME_RATE   = config.get("PREPROCESS.FRAME_RATE")
WINDOW_TIME  = config.get("PREPROCESS.GAMMA.WINDOW_TIME")
HOP_TIME     = config.get("PREPROCESS.GAMMA.HOP_TIME")
CHANNELS     = config.get("PREPROCESS.GAMMA.CHANNELS")
F_MIN        = config.get("PREPROCESS.GAMMA.F_MIN")
MODEL_PATH   = os.path.join(config.get("REALTIME.MODEL_PATH"), "saved_model", "vq_vae")
MIN_VAL      = config.get("REALTIME.MIN")
MAX_VAL      = config.get("REALTIME.MAX")
USE_TF_GAMMA = config.get("PREPROCESS.USE_TF_GTGRAM", False)
COMPARE      = config.get("DEVICE.COMPARE_MODELS", False)
TRT_ENGINE   = config.get("REALTIME.TRT_ENGINE_PATH", "")
MANUAL_THRES = config.get("REALTIME.MANUAL_THRESHOLD")
SHM_KEY      = 0x1234
SEM_KEY      = 0x5678
SHM_SIZE     = 176_400
EXCEED_LIMIT = 1

log_dir = config.get("REALTIME.LOG_PATH", "./logs")
os.makedirs(log_dir, exist_ok=True)
logging.basicConfig(
    filename=os.path.join(log_dir, "processing_time.log"),
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)
logger.info("Config: %s", config.config)

# ============================================================
# 2 | Model loading
# ============================================================
logger_trt = trt.Logger(trt.Logger.WARNING)

def load_plain_model():
    logger.info("Loading plain TF model from %s", MODEL_PATH)
    mdl = load_model(MODEL_PATH)
    return lambda x: mdl.predict(x, verbose=0)


def _alloc_host_mem(elements: int, dtype):
    try:
        return cuda.pagelocked_empty(elements, dtype=dtype)
    except Exception as e:
        logger.warning(
            "Pinned alloc failed for %d elems (%s), using np.empty", elements, e
        )
        return np.empty(elements, dtype=dtype)


def load_trt_engine(engine_path: str):
    if not os.path.isfile(engine_path):
        raise FileNotFoundError(engine_path)
    logger.info("Loading TRT engine: %s", engine_path)

    # load engine
    with open(engine_path, "rb") as f, trt.Runtime(logger_trt) as rt:
        engine = rt.deserialize_cuda_engine(f.read())
    context = engine.create_execution_context()

    # set explicit batch=1
    BATCH = 1
    in_shape_proto = tuple(engine.get_binding_shape(0))
    in_shape = (BATCH, *in_shape_proto[1:])
    context.set_binding_shape(0, in_shape)
    out_shape = tuple(context.get_binding_shape(1))

    # compute volumes
    vol_in = trt.volume(in_shape)
    vol_out = trt.volume(out_shape)

    # query binding dtypes
    dtype_in = engine.get_binding_dtype(0)
    dtype_out = engine.get_binding_dtype(1)
    # map to numpy
    np_dtype_in = np.float32 if dtype_in == trt.DataType.FLOAT else np.float16
    np_dtype_out = np.float32 if dtype_out == trt.DataType.FLOAT else np.float16

    # allocate host/device buffers
    h_in = _alloc_host_mem(vol_in, np_dtype_in)
    h_out = _alloc_host_mem(vol_out, np_dtype_out)
    d_in = cuda.mem_alloc(h_in.nbytes)
    d_out = cuda.mem_alloc(h_out.nbytes)
    stream = cuda.Stream()

    def _predict(x: np.ndarray) -> np.ndarray:
        # expect NCHW input
        if x.dtype != np_dtype_in:
            x = x.astype(np_dtype_in)
        assert x.shape == in_shape, f"Expect {in_shape}, got {x.shape}"
        # host copy and H2D
        np.copyto(h_in, x.ravel())
        cuda.memcpy_htod_async(d_in, h_in, stream)
        # execute
        context.execute_async_v2([int(d_in), int(d_out)], stream.handle)
        # D2H and sync
        cuda.memcpy_dtoh_async(h_out, d_out, stream)
        stream.synchronize()
        # reshape and convert to float32
        out = h_out.reshape(out_shape)
        if np_dtype_out != np.float32:
            out = out.astype(np.float32)
        return out

    return _predict

# initialize models
run_plain = load_plain_model()
run_trt = load_trt_engine(TRT_ENGINE) if COMPARE else None

# ============================================================
# 3 | Preprocessing & metrics
# ============================================================
def preprocess_audio(audio: np.ndarray) -> np.ndarray:
    gtg = cpu_gtgram(audio, FRAME_RATE, WINDOW_TIME, HOP_TIME, CHANNELS, F_MIN)
    db = 20.0 * np.log10(gtg + 1e-10)
    norm = np.clip((db - MIN_VAL) / (MAX_VAL - MIN_VAL), 0.0, 1.0)
    # NHWC shape
    return norm.reshape(1, CHANNELS, norm.shape[1], 1).astype(np.float32)


def mse_between(a: np.ndarray, b: np.ndarray) -> float:
    return float(np.mean((a - b) ** 2))


def predict_pair(audio: np.ndarray):
    inp = preprocess_audio(audio)  # NHWC

    # plain inference
    t0 = time.perf_counter()
    pred_plain = run_plain(inp)
    t1 = time.perf_counter()
    mse_plain = mse_between(inp, pred_plain)
    lat_plain = (t1 - t0) * 1e3

    if COMPARE and run_trt:
        # prepare NCHW for TRT
        inp_nchw = np.transpose(inp, (0, 3, 1, 2))
        t2 = time.perf_counter()
        pred_trt = run_trt(inp_nchw)
        t3 = time.perf_counter()
        # output is NHWC, same as inp
        mse_trt = mse_between(inp, pred_trt)
        lat_trt = (t3 - t2) * 1e3
        return mse_plain, lat_plain, mse_trt, lat_trt

    return mse_plain, lat_plain, None, None

# ============================================================
# 4 | Shared-memory & loops
# ============================================================
shm = sem = None

def cleanup():
    global shm
    if shm:
        try:
            shm.detach()
            logger.info("Shared mem detached")
        except Exception:
            pass

signal.signal(signal.SIGINT, lambda s, f: sys.exit(0))
signal.signal(signal.SIGTERM, lambda s, f: sys.exit(0))

def wait_for_shared_memory():
    global shm, sem
    while True:
        try:
            shm = sysv_ipc.SharedMemory(SHM_KEY)
            break
        except sysv_ipc.ExistentialError:
            time.sleep(1)
    while True:
        try:
            sem = sysv_ipc.Semaphore(SEM_KEY)
            break
        except sysv_ipc.ExistentialError:
            time.sleep(1)


def process_realtime():
    last = time.time()
    while True:
        dt = time.time() - last
        if dt < 2.0:
            time.sleep(2.0 - dt)
        last = time.time()

        sem.acquire()
        raw = shm.read(SHM_SIZE)
        sem.release()
        audio = np.frombuffer(raw, dtype=np.int16)

        mse_p, lat_p, mse_t, lat_t = predict_pair(audio)
        if mse_p > MANUAL_THRES:
            print("Anomaly detected (Plain)")
        if COMPARE and mse_t > MANUAL_THRES:
            print("Anomaly detected (TRT)")
        if COMPARE:
            print(f"MSE_plain={mse_p:.6f}|{lat_p:.2f} ms   MSE_TRT={mse_t:.6f}|{lat_t:.2f} ms")
        else:
            print(f"{mse_p:.6f} ({lat_p:.2f} ms)")
        logger.info(
            "Loop plain %.6f (%.2f ms)%s",
            mse_p,
            lat_p,
            f" | TRT {mse_t:.6f} ({lat_t:.2f} ms)" if COMPARE else "",
        )


def process_folder(folder: str):
    files = sorted(f for f in os.listdir(folder) if f.endswith('.wav'))
    exceed = 0
    for fname in files:
        with wave.open(os.path.join(folder, fname), 'rb') as wf:
            audio = np.frombuffer(wf.readframes(wf.getnframes()), dtype=np.int16)
        mse_p, lat_p, mse_t, lat_t = predict_pair(audio)
        if mse_p > MANUAL_THRES:
            exceed += 1
        else:
            exceed = 0
        if exceed > EXCEED_LIMIT:
            print("Anomaly detected (Plain)")
            exceed = 0
        if COMPARE:
            print(f"{fname}: plain {mse_p:.6f}|{lat_p:.2f} ms   TRT {mse_t:.6f}|{lat_t:.2f} ms")
        else:
            print(f"{fname}: {mse_p:.6f} ({lat_p:.2f} ms)")
        logger.info(
            "File %s plain %.6f (%.2f ms)%s",
            fname,
            mse_p,
            lat_p,
            f" | TRT {mse_t:.6f} ({lat_t:.2f} ms)" if COMPARE else "",
        )


def main():
    if not config.get("REALTIME.IMPORT_FILE"):
        wait_for_shared_memory()
        process_realtime()
    else:
        process_folder(config.get("REALTIME.FOLDER_PATH"))

if __name__ == '__main__':
    main()

