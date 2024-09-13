#include "recordingcontroller.h"
#include <QDebug>

RecordingController::RecordingController(QObject *parent)
    : m_fileFactory(nullptr)
    , m_recordIO(nullptr)
    , m_audioConfigFile(nullptr)
    , m_recordingSchedule(nullptr)
    , m_recordingChart(new RecordingChart())
    , m_audioConfig(new AudioConfig())
    , m_recordIO(new RecordIO())
    , m_audioFile()
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
    QAudioFormat format = m_audioConfig->format();
    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();

    setRecStatus(true);

    connect(this, &RecordingController::sendChartData, m_recordingChart, &RecordingChart::onSendChartData);

    // connect(m_recordingChart, &RecordingChart::audioSeriesChanged, this, &RecordingController::setRecoringChartBuffer);

    if (!m_audioFile.startRecording("minhhihi.wav", format)) {
        qDebug() << "Không thể ghi file";
    }

    m_recordIO = new RecordIO();

    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);
    QAudioFormat format = m_audioConfig->settings();
    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();

    m_fileFactory = new AudioFileFactory(format);

    m_recordIO->startAudioInput(format, deviceInfo);

    // Currently, I fixed the duratione of audio file is 5 seconds
    m_fileFactory->setFileDuration(5000);
    m_fileFactory->startRecording();
    // should be check the real value of InputAudio -> setRecStatus
    // if it cannot turn on the InputAudio -> show alert to .qml
    // I refer you use try..catch pattern
    setRecStatus(true);
    qInfo() << "Hi Giang, this is start recording";
}

void RecordingController::stopRecording()
{
    if (recStatus() == true) {
        m_audioFile.stopRecording();
        m_recordIO->audioInputStop();
        qInfo() << "Hi Giang, this is stop recording";
        m_recordingChart = nullptr;
        m_fileFactory = nullptr;
    }
    setRecStatus(false);
    m_recordIO->audioInputStop();
    qInfo() << "Hi Giang, this is stop recording";
    m_recordIO = nullptr;
    m_fileFactory = nullptr;
}

void RecordingController::handleDataReady(const QByteArray &data)
{
    m_recordingChart->onSendChartData(data);
    // qInfo()<< "handleDataReady" << data.at(0);

    m_audioFile.writeAudioData(data);
    // m_fileFactory->setFilePath("/home/gianghandsome/ESCA/data/test.wav");
}

bool RecordingController::recStatus() const
{
    return m_recStatus;
    m_fileFactory->appendDataToBuffer(data);
}

void RecordingController::setRecStatus(bool newRecStatus)
{
    if (m_recStatus == newRecStatus)
        return;
    m_recStatus = newRecStatus;
    emit recStatusChanged();
}
