#include "recordingcontroller.h"
#include <QDebug>

RecordingController::RecordingController(QObject *parent)
    : m_fileFactory(nullptr)
    , m_recordIO(nullptr)
    , m_audioConfigFile(nullptr)
    , m_recordingSchedule(nullptr)
    , m_recordingChart(new RecordingChart())
    , m_audioConfig(new AudioConfig())
{
    qmlRegisterSingletonInstance("AudioConfigImport", 1, 0, "AudioConfig", m_audioConfig);
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);
    setRecStatus(false);

    // m_audioConfigFile->setFilePath(RECORDING_CONFIG_FILE);
}

RecordingController::~RecordingController()
{
    // m_recordIO->audioInputStop();
}

void RecordingController::startRecording()
{
    m_recordIO = new RecordIO();

    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    QAudioFormat format = m_audioConfig->settings();
    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();

    m_fileFactory = new AudioFileFactory(format);

    m_recordIO->startAudioInput(format, deviceInfo);

    // should be check the real value of InputAudio
    setRecStatus(true);
    qInfo() << "Hi Giang, this is start recording";
}

void RecordingController::stopRecording()
{
    setRecStatus(false);
    m_recordIO->audioInputStop();
    qInfo() << "Hi Giang, this is stop recording";
    m_recordIO = nullptr;
    m_recordingChart = nullptr;
    m_fileFactory = nullptr;
}

void RecordingController::handleDataReady(const QByteArray &data)
{
    m_recordingChart->onSendChartData(data);
    qInfo()<< "handleDataReady" << data.at(0);

    m_fileFactory->setFilePath("/home/gianghandsome/ESCA/data/test.wav");
}

void RecordingController::setRecStatus(bool newRecStatus)
{
    if (m_recStatus == newRecStatus)
        return;
    m_recStatus = newRecStatus;
    emit recStatusChanged();
}
