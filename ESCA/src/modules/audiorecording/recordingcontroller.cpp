#include "recordingcontroller.h"
#include <QDebug>

RecordingController::RecordingController(QObject *parent)
    : QObject(parent)
    , m_recordIO(new RecordIO())
    , m_recordingChart(new RecordingChart())
    , m_audioConfig(new AudioConfig())
    , m_audioFile(nullptr)
    , m_audioFileThread(nullptr)
    , m_recordingSchedule(nullptr)
    , format(m_audioConfig->format())
    , m_recStatus(false)
    , sharedMemoryManager(new SharedMemoryManager(this))
{
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);
    qmlRegisterSingletonInstance("AudioConfigImport", 1, 0, "AudioConfig", m_audioConfig);
    setRecStatus(false);

    // m_outputDir = QStandardPaths::writableLocation(QStandardPaths::HomeLocation);

    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    connect(this, &RecordingController::sendChartData, m_recordingChart, &RecordingChart::onSendChartData);

    qInfo()<<"format in ini: "<<m_audioConfig->format();

    if (!sharedMemoryManager->init_ipc()) {
        qDebug()<< "Failed to initialize IPC.";
        delete sharedMemoryManager;
    }
}

RecordingController::~RecordingController()
{
    // m_recordIO->audioInputStop();
    stopRecording();

    // Dừng và dọn dẹp thread nếu còn chạy
    if (m_audioFileThread && m_audioFileThread->isRunning()) {
        m_audioFileThread->quit();
        m_audioFileThread->wait();
    }
    delete m_audioFile;
    delete m_audioFileThread;
    delete m_recordingChart;
    delete m_recordIO;
    delete m_audioConfig;
    qDebug() << "RecordingController destroyed.";
}

void RecordingController::startRecording()
{
    QAudioFormat format = m_audioConfig->format();
    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();
    m_outputDir = m_audioConfig->listOutput();
    qDebug()<< "m_outputDir"<< m_outputDir;

    m_audioFile = new AudioFile(m_outputDir, format, 2.0);

    // Đảm bảo thread chưa chạy thì start lại
    if (!m_audioFileThread) {
        m_audioFileThread = new QThread();
    } else if (m_audioFileThread->isRunning()) {
        m_audioFileThread->quit();
        m_audioFileThread->wait();
    }

    m_recordIO->startAudioInput(format, deviceInfo);
    qInfo() << "format before thread" << format;

    m_audioFile->moveToThread(m_audioFileThread);   // cho AudioFile vào thread riêng

    // Kết nối các signal và slot để quản lý thread và AudioFile
    connect(m_audioFileThread, &QThread::started, m_audioFile, &AudioFile::startRecording);
    connect(m_audioFile, &AudioFile::destroyed, m_audioFileThread, &QThread::quit);
    connect(m_audioFile, &AudioFile::destroyed, m_audioFileThread, &QObject::deleteLater);

    // Start thread
    m_audioFileThread->start();

    setRecStatus(true);
    qInfo() << "Start recording with format" << format;

    sharedMemoryManager->start();
    qDebug() << "Producer Record is running.";
}

void RecordingController::stopRecording()
{
    if (recStatus() == true) {
        m_audioFile->stopRecording();
        m_recordIO->audioInputStop();
        qInfo() << "Stop recording";
        // m_recordingChart = nullptr;
        // m_recordIO = nullptr;
    }
    setRecStatus(false);   
}

void RecordingController::handleDataReady(const QByteArray &data)
{
    // audioBuffer.append(data);
    QByteArray &currentBuffer = m_usingBuffer1 ? audioBuffer1 : audioBuffer2;
    currentBuffer.append(data);

    if (currentBuffer.size() >= chunkSize) {
        // Ghi dữ liệu vào file
        // Chuyển buffer
        m_usingBuffer1 = !m_usingBuffer1;

        sharedMemoryManager->getAudioData(currentBuffer);
        // qDebug()<<"Buffer: "<< currentBuffer;

        QString duration = m_audioConfig->duration();
        // qDebug()<<"handleDataReady for:" <<duration;
        if (duration == "2s"){
            // Chuyển tiếp dữ liệu cho AudioFile để xử lý buffering và ghi file
            if (m_audioFile) {
                QMetaObject::invokeMethod(m_audioFile, "writeAudioData",
                                          Qt::QueuedConnection,
                                          Q_ARG(QByteArray, currentBuffer));
            }
        }
        else {
            if (m_audioFile) {
                QMetaObject::invokeMethod(m_audioFile, "writeDataForever",
                                          Qt::QueuedConnection,
                                          Q_ARG(QByteArray, currentBuffer));
            }
        }

        // Chỉ xóa buffer nếu dữ liệu thực sự được ghi
        if (currentBuffer.size() >= chunkSize) {
            currentBuffer.remove(0, chunkSize);
        }
    }
    m_recordingChart->onSendChartData(data);
}

bool RecordingController::recStatus() /*const*/
{
    return m_recStatus;
}

void RecordingController::setRecStatus(bool newRecStatus)
{
    if (m_recStatus == newRecStatus)
        return;
    m_recStatus = newRecStatus;
    emit recStatusChanged();
}
