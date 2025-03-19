#ifndef SharedMemoryManager_H
#define SharedMemoryManager_H

#include <QThread>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <string>
#include <QByteArray>
#include <QMutexLocker>
#include <QMutex>

class SharedMemoryManager : public QThread {
    Q_OBJECT
public:
    SharedMemoryManager(QObject* parent = nullptr);
    ~SharedMemoryManager();

    bool init_ipc();
    void cleanup_ipc();
    void run() override;
    void stop();

public slots:

    void getAudioData(const QByteArray &data);

signals:
    void bufferChanged();

private:
    key_t shm_key;
    key_t sem_key;
    size_t shm_size;
    int shm_id;
    int sem_id;
    bool running;

    QByteArray buffer;   // 2s buffer
    // Mutex để đồng bộ hóa khi ghi vào buffer
    QMutex m_bufferMutex;

    // Semaphore operations
    struct sembuf sem_lock;
    struct sembuf sem_unlock;
};

#endif // SharedMemoryManager_H
