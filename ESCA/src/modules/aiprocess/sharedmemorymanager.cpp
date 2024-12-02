    #include "sharedmemorymanager.h"
#include <cstring>
#include <iostream>
#include <csignal>
#include <QDebug>

#define SHM_KEY 0x1234
#define SEM_KEY 0x5678
#define SHM_SIZE 176400

SharedMemoryManager::SharedMemoryManager(QObject* parent)
    : QThread(parent), shm_key(SHM_KEY), sem_key(SEM_KEY), shm_size(SHM_SIZE),
    shm_id(-1), sem_id(-1), running(true) {
    // Initialize semaphore operations
    sem_lock = {0, -1, 0};  // P operation
    sem_unlock = {0, 1, 0}; // V operation
}

SharedMemoryManager::~SharedMemoryManager() {
    cleanup_ipc();
}

bool SharedMemoryManager::init_ipc() {
    // Tạo shared memory
    shm_id = shmget(shm_key, shm_size, IPC_CREAT | 0666);
    if (shm_id < 0) {
        perror("shmget failed");
        return false;
    }

    // Tạo semaphore
    sem_id = semget(sem_key, 1, IPC_CREAT | 0666);
    if (sem_id < 0) {
        perror("semget failed");
        return false;
    }

    // Khởi tạo semaphore nếu mới tạo
    if (semctl(sem_id, 0, GETVAL) == 0) { // Nếu semaphore chưa được khởi tạo
        if (semctl(sem_id, 0, SETVAL, 1) == -1) {
            perror("semctl SETVAL failed");
            return false;
        }
    }

    return true;
}

void SharedMemoryManager::cleanup_ipc() {
    if (shm_id != -1) {
        if (shmctl(shm_id, IPC_RMID, nullptr) == -1) {
            perror("shmctl IPC_RMID failed");
        } else {
            std::cout << "Shared memory removed." << std::endl;
        }
        shm_id = -1;
    }
    if (sem_id != -1) {
        if (semctl(sem_id, 0, IPC_RMID) == -1) {
            perror("semctl IPC_RMID failed");
        } else {
            std::cout << "Semaphore removed." << std::endl;
        }
        sem_id = -1;
    }
}

void SharedMemoryManager::run() {
    while (running) {

        // Thực hiện P operation để khóa semaphore
        if (semop(sem_id, &sem_lock, 1) == -1) {
            perror("semop lock failed");
            continue;
        }

        // Gắn shared memory
        char* shm_ptr = static_cast<char*>(shmat(shm_id, nullptr, 0));
        if (shm_ptr == reinterpret_cast<char*>(-1)) {
            perror("shmat failed");
            // Thực hiện V operation để mở khóa semaphore
            semop(sem_id, &sem_unlock, 1);
            continue;
        }

        // Ghi dữ liệu vào shared memory
        memset(shm_ptr, 0, shm_size);
        strncpy(shm_ptr, buffer, shm_size - 1);

        // qDebug()<<"Buffer shm"<<buffer;

        // Ngắt kết nối shared memory
        if (shmdt(shm_ptr) == -1) {
            perror("shmdt failed");
        }

        // Thực hiện V operation để mở khóa semaphore
        if (semop(sem_id, &sem_unlock, 1) == -1) {
            perror("semop unlock failed");
        }

        // Giới hạn tốc độ gửi
        msleep(100);
    }
}

void SharedMemoryManager::getAudioData(const QByteArray &data)
{
    buffer = data;
}

void SharedMemoryManager::stop() {
    running = false;
}

