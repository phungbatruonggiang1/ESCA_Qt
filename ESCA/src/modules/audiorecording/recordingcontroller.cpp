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
{
    qmlRegisterSingletonInstance("AudioConfigImport", 1, 0, "AudioConfig", m_audioConfig);
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);
    setRecStatus(false);

    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    connect(this, &RecordingController::sendChartData, m_recordingChart, &RecordingChart::onSendChartData);

    qInfo()<<"format in ini: "<<m_audioConfig->format();

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
    // QAudioFormat format = m_audioConfig->format();
    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();

    qInfo() << "format before thread" << format;

    // m_outputDir = m_audioConfig->outputDir();

    m_audioFile = new AudioFile(m_outputDir, format, 10.0);
    m_audioFileThread = new QThread();
    m_audioFile->moveToThread(m_audioFileThread);   // cho AudioFile vào thread riêng

    // Kết nối các signal và slot để quản lý thread và AudioFile
    connect(m_audioFileThread, &QThread::started, m_audioFile, &AudioFile::startRecording);
    connect(m_audioFile, &AudioFile::destroyed, m_audioFileThread, &QThread::quit);
    connect(m_audioFile, &AudioFile::destroyed, m_audioFileThread, &QObject::deleteLater);

    // Start thread
    m_audioFileThread->start();

    // Bắt đầu RecordingIO
    m_recordIO->startAudioInput(format, deviceInfo);

    // Currently, I fixed the duratione of audio file is 5 seconds
    // m_fileFactory->setFileDuration(5000);
    // m_fileFactory->startRecording();
    // should be check the real value of InputAudio -> setRecStatus
    // if it cannot turn on the InputAudio -> show alert to .qml
    // I refer you use try..catch pattern

    setRecStatus(true);
    qInfo() << "Start recording with format" << format;
}

void RecordingController::stopRecording()
{
    if (recStatus() == true) {
        m_audioFile->stopRecording();
        m_recordIO->audioInputStop();
        qInfo() << "Hi Giang, this is stop recording";
        // m_recordingChart = nullptr;
        // m_recordIO = nullptr;
    }
    setRecStatus(false);   
}

void RecordingController::handleDataReady(const QByteArray &data)
{

    QString duration = m_audioConfig->duration();
    // qDebug()<<"handleDataReady for:" <<duration;
    if (duration == "10s"){
        // Chuyển tiếp dữ liệu cho AudioFile để xử lý buffering và ghi file
        if (m_audioFile) {
            QMetaObject::invokeMethod(m_audioFile, "writeAudioData",
                                      Qt::QueuedConnection,
                                      Q_ARG(QByteArray, data));
        }
    }
    else {
        if (m_audioFile) {
            QMetaObject::invokeMethod(m_audioFile, "writeDataForever",
                                      Qt::QueuedConnection,
                                      Q_ARG(QByteArray, data));
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
