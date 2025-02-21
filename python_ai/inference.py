import sysv_ipc
import signal
import sys
import time
import numpy as np	
from gammatone import gtgram
from tensorflow.keras.models import load_model
from config.config_manager import ConfigManager

config_manager = ConfigManager()

# print("Cấu hình mặc định:")
# print(config_manager.config)

# Định nghĩa khóa và kích thước shared memory
SHM_KEY = 0x1234
SEM_KEY = 0x5678
SHM_SIZE = 176400

EXCEED_LIMIT = 2

# # SAMPLE_RATE = 44100 
# # NUM_CHANNELS = 1   
# # BIT_DEPTH = 16   
# SAMPLE_RATE = config_manager.get("REALTIME.SAMPLE_RATE")
# NUM_CHANNELS = config_manager.get("REALTIME.CHANNEL")
# BIT_DEPTH = config_manager.get("REALTIME.SAMPLE_SIZE")
# print(f"SAMPLE_RATE: {SAMPLE_RATE}{NUM_CHANNELS}{BIT_DEPTH}")

# frame_rate = 44100  
# window_time = 0.12  
# hop_time = 0.06 
# channels = 32  
# f_min = 100  
frame_rate = config_manager.get("PREPROCESS.FRAME_RATE")
window_time = config_manager.get("PREPROCESS.GAMMA.WINDOW_TIME")
hop_time = config_manager.get("PREPROCESS.GAMMA.HOP_TIME")
channels = config_manager.get("PREPROCESS.GAMMA.CHANNELS")
f_min = config_manager.get("PREPROCESS.GAMMA.F_MIN")
model_path = config_manager.get("REALTIME.MODEL_PATH") + "/saved_model/vq_vae"
manual_threshold = config_manager.get("REALTIME.MANUAL_THRESHOLD")

print(f"model_path: {model_path}")
print(f"frame_rate: {frame_rate}, window_time: {window_time}, hop_time: {hop_time}, channels: {channels}, f_min: {f_min}, manual_threshold {manual_threshold}")

threshold = config_manager.get("REALTIME.THRESHOLD")
MIN = config_manager.get("REALTIME.MIN")
MAX = config_manager.get("REALTIME.MAX")

# threshold = 0.002630938310176134 
# MIN = -23.14520263671875 
# MAX = 51.67738342285156  
a_min = 0  
a_max = 1  

print(f"threshold: {threshold}, MIN: {MIN}, MAX: {MAX}")

# print("Loading model...", model_path)
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
    đợi cho đến khi shared memory và semaphore có sẵn
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

def main():

    global shm, semaphore
    exceed_count = 0

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    
    wait_for_shared_memory()

    try:
        # Kết nối tới shared memory
        shm = sysv_ipc.SharedMemory(SHM_KEY)
    except sysv_ipc.ExistentialError:
        print("Shared memory không tồn tại. Hãy chắc chắn rằng Producer đang chạy.")
        sys.exit(1)

    try:
        # Kết nối tới semaphore
        semaphore = sysv_ipc.Semaphore(SEM_KEY)
    except sysv_ipc.ExistentialError:
        print("Semaphore không tồn tại. Hãy chắc chắn rằng Producer đang chạy.")
        sys.exit(1)

    while True:
        try:
            # Thực hiện P operation để khóa semaphore
            semaphore.acquire()
            # Đọc dữ liệu nhị phân từ shared memory lưu ra buffer
            raw_data = bytearray(shm.read(SHM_SIZE))
            # print("raw audio data: ", raw_data)
                        
            audio_array = np.frombuffer(raw_data, dtype=np.int16)
            # print("audio data: ", audio_array)
            gtg = gtgram.gtgram(audio_array, frame_rate, window_time, hop_time, channels, f_min)
            # print("gtg: ", gtg)

            # Xử lý feature (chuyển đỗi sang log-spectrogram)
            a = np.flipud(20 * np.log10(gtg + 0.000000001))
            # print("a step 1: ", a, a.shape)
            a = np.clip((a - MIN) / (MAX - MIN), a_min=0, a_max=1)
            # print("a step 2: ", a, a.shape)
            a = np.reshape(a, (1, a.shape[0], a.shape[1], 1))
            # print("a step 3: ", a, a.shape)

            if a.shape != (1, 32, 32, 1):
                #print(f"Input shape Error: {a.shape}")
                return
    
            # Tính MSE giữa input và output của autoencoder (sử dụng mô hình đã huấn luyện)
            pred = np.mean((a - model.predict(a, verbose=0))**2)

            # So sánh giá trị pred với threshold
            if pred > manual_threshold:
                exceed_count += 1                
            else:
                exceed_count = 0

            # Nếu vượt ngưỡng liên tục hơn giới hạn, in ra cảnh báo (string)
            if exceed_count > EXCEED_LIMIT:
                print("Anomaly detected!", flush=True)
                exceed_count = 0  # Reset sau khi cảnh báo

            print(pred, flush=True) 
            
            # Thực hiện V operation để mở khóa semaphore
            semaphore.release()

            # print(f"Processing time: {end_time - start_time} seconds and Pred: {pred}")   
                       
        
        except sysv_ipc.BusyError:
            print("Semaphore is busy. Skipping this cycle.")
        except Exception as e:
            print(f"Unexpected error: {e}")
            try:
                semaphore.release()
            except sysv_ipc.ExistentialError:
                pass

        #time.sleep(0.01)  # 100ms

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        signal_handler(signal.SIGINT, None)