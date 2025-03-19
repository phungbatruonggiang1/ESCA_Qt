import sysv_ipc
import signal
import sys
import time
import numpy as np
from gammatone import gtgram
from tensorflow.keras.models import load_model
import os
import soundfile as sf  # Để đọc file WAV

from config.config_manager import ConfigManager

config_manager = ConfigManager()

# Định nghĩa khóa và kích thước shared memory
SHM_KEY = 0x1234
SEM_KEY = 0x5678
SHM_SIZE = 176400

EXCEED_LIMIT = 2

# Lấy tham số cấu hình từ config
frame_rate = config_manager.get("PREPROCESS.FRAME_RATE")
window_time = config_manager.get("PREPROCESS.GAMMA.WINDOW_TIME")
hop_time = config_manager.get("PREPROCESS.GAMMA.HOP_TIME")
channels = config_manager.get("PREPROCESS.GAMMA.CHANNELS")
f_min = config_manager.get("PREPROCESS.GAMMA.F_MIN")
model_path = config_manager.get("REALTIME.MODEL_PATH") + "/saved_model/vq_vae"
manual_threshold = config_manager.get("REALTIME.MANUAL_THRESHOLD")
threshold = config_manager.get("REALTIME.THRESHOLD")
MIN = config_manager.get("REALTIME.MIN")
MAX = config_manager.get("REALTIME.MAX")

a_min = 0  
a_max = 1  

print(f"model_path: {model_path}")
print(f"frame_rate: {frame_rate}, window_time: {window_time}, hop_time: {hop_time}, channels: {channels}, f_min: {f_min}, manual_threshold {manual_threshold}")
print(f"threshold: {threshold}, MIN: {MIN}, MAX: {MAX}")

# Load model
model = load_model(model_path)

# Khởi tạo biến để giữ IPC
shm = None
semaphore = None

def cleanup():
    """
    Hàm dọn dẹp shared memory và semaphore khi thoát.
    """
    global shm, semaphore
    if shm:
        try:
            shm.detach()
            print("Shared memory detached.")
        except Exception as e:
            print(f"Failed to detach shared memory: {e}")

def signal_handler(signum, frame):
    """
    Xử lý tín hiệu (SIGINT, SIGTERM).
    """
    print(f"Signal {signum} received. Exiting...")
    cleanup()
    sys.exit(0)

def wait_for_shared_memory():
    """
    Đợi cho đến khi shared memory và semaphore có sẵn.
    """
    global shm, semaphore
    while True:
        try:
            shm = sysv_ipc.SharedMemory(SHM_KEY)
            print("Shared memory connected.")
            break
        except sysv_ipc.ExistentialError:
            print("Shared memory không tồn tại. Đang chờ...")
            time.sleep(1)

    while True:
        try:
            semaphore = sysv_ipc.Semaphore(SEM_KEY)
            print("Semaphore connected.")
            break
        except sysv_ipc.ExistentialError:
            print("Semaphore không tồn tại. Đang chờ...")
            time.sleep(1)

def predict_mse(audio_array):
    """
    Hàm tính MSE từ input audio và dự đoán của mô hình
    """
    gtg = gtgram.gtgram(audio_array, frame_rate, window_time, hop_time, channels, f_min)
    # Chuyển sang log-spectrogram
    a = np.flipud(20 * np.log10(gtg + 0.000000001))
    # Chuẩn hoá [0, 1]
    a = np.clip((a - MIN) / (MAX - MIN), a_min=0, a_max=1)
    a = np.reshape(a, (1, a.shape[0], a.shape[1], 1))

    if a.shape != (1, 32, 32, 1):
        print(f"Input shape không hợp lệ: {a.shape}")
        return None

    pred = model.predict(a, verbose=0)
    mse = np.mean((a - pred)**2)
    return mse

def process_realtime():
    """
    Xử lý âm thanh theo chế độ real-time từ shared memory.
    """
    global shm, semaphore
    exceed_count = 0

    while True:
        try:
            # Thực hiện P operation để khóa semaphore
            semaphore.acquire()
            # Đọc dữ liệu nhị phân từ shared memory
            raw_data = bytearray(shm.read(SHM_SIZE))
            audio_array = np.frombuffer(raw_data, dtype=np.int16)
            # print(f"Received data: {audio_array[:10]}...")

            # Tính MSE
            mse = predict_mse(audio_array)
            if mse is None:
                semaphore.release()
                continue

            # Kiểm tra anomaly
            if mse > manual_threshold:
                exceed_count += 1
            else:
                exceed_count = 0

            if exceed_count > EXCEED_LIMIT:
                print("Anomaly detected!", flush=True)
                exceed_count = 0  # reset

            print(mse, flush=True)

            # Thực hiện V operation để mở khóa semaphore
            semaphore.release()

        except sysv_ipc.BusyError:
            print("Semaphore is busy. Skipping this cycle.")
        except Exception as e:
            print(f"Unexpected error: {e}")
            try:
                semaphore.release()
            except sysv_ipc.ExistentialError:
                pass

def process_folder(folder_path):
    """
    Xử lý âm thanh từ các file WAV trong thư mục.
    """
    exceed_count = 0

    wav_files = [f for f in os.listdir(folder_path) if f.lower().endswith(".wav")]
    wav_files.sort()  # Sort to ensure order
    # print(f"Files: {wav_files}")

    for wav_file in wav_files:
        file_path = os.path.join(folder_path, wav_file)
        # print(f"\n=== Đang xử lý file: {file_path} ===")

        # Đọc audio từ file WAV
        audio_array, sr = sf.read(file_path)

        # Nếu file là stereo, chuyển sang mono
        if audio_array.ndim > 1:
            audio_array = np.mean(audio_array, axis=1)

        # Nếu sample rate khác với frame_rate, có thể cần resample
        if sr != frame_rate:
            print(f"File {wav_file} có sr={sr}, cần resample về {frame_rate}!")

        # Chuyển audio array về int16
        audio_array = (audio_array * 32767).astype(np.int16)

        # Tính MSE
        mse = predict_mse(audio_array)
        if mse is None:
            continue

        # Kiểm tra anomaly
        if mse > manual_threshold:
            exceed_count += 1
        else:
            exceed_count = 0

        if exceed_count > EXCEED_LIMIT:
            print("Anomaly detected!", flush=True)
            exceed_count = 0  # reset
        print(mse, flush=True)

    print("Hoàn thành xử lý thư mục.")    

def main():
    """
    Hàm chính: Tùy thuộc vào giá trị IMPORT_FILE để xử lý dữ liệu.
    """
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    # Kiểm tra chế độ thực thi từ config
    import_file = config_manager.get("REALTIME.IMPORT_FILE")  # True cho Folder Mode, False cho Real-time Mode
    print(f"IMPORT_FILE: {import_file}")
    # Nếu là chế độ real-time (IMPORT_FILE = False)
    if not import_file:
        print("Chế độ Real-time")
        # Chỉ trong chế độ real-time mới cần shared memory
        wait_for_shared_memory()
        process_realtime()

    # Nếu là chế độ folder (IMPORT_FILE = True)
    elif import_file:
        folder_path = config_manager.get("REALTIME.FOLDER_PATH")
        print(f"Chế độ Folder, xử lý thư mục: {folder_path}")
        process_folder(folder_path)

    else:
        print("Chế độ không hợp lệ!")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        signal_handler(signal.SIGINT, None)
