#include "recordingcontroller.h"
#include <QDebug>

RecordingController::RecordingController(QObject *parent)
    : m_fileFactory(nullptr)
    , m_recordingChart(new RecordingChart())
    , m_recordDevice(nullptr)
    , m_audioConfig(new AudioConfig())
    , m_recordIO(new RecordIO())
    , m_audioFile()
{
    qmlRegisterSingletonInstance("AudioConfigImport", 1, 0, "AudioConfig", m_audioConfig);
    qmlRegisterSingletonInstance("AudioChartImport", 1, 0, "AudioChart", m_recordingChart);

    setRecStatus(false);

    connect(m_recordIO, &RecordIO::sendData, this, &RecordingController::handleDataReady);    

    m_audioConfigFile = new AudioConfigFile();
    m_audioConfigFile->setFilePath(RECORDING_CONFIG_FILE);
}

RecordingController::~RecordingController()
{
    // m_recordIO->audioInputStop();
}

void RecordingController::startRecording()
{
    QAudioFormat format = m_audioConfig->settings();
    QAudioDeviceInfo deviceInfo = m_audioConfig->deviceInfo();

    setRecStatus(true);

    connect(this, &RecordingController::sendChartData, m_recordingChart, &RecordingChart::onSendChartData);

    // connect(m_recordingChart, &RecordingChart::audioSeriesChanged, this, &RecordingController::setRecoringChartBuffer);

    if (!m_audioFile.startRecording("minhhihi.wav", format)) {
        qDebug() << "Không thể ghi file";
    }

    m_recordIO->startAudioInput(format, deviceInfo);

    qInfo() << "Hi Giang, this is start recording";
}

void RecordingController::stopRecording()
{
    m_audioFile.stopRecording();
    setRecStatus(false);
    m_recordIO->audioInputStop();
    qInfo() << "Hi Giang, this is stop recording";
    m_recordingChart = nullptr;
    m_fileFactory = nullptr;
}

void RecordingController::handleDataReady(const QByteArray &data)
{
    // m_recordingChart->updateData(buffer);
    emit sendChartData(data);
    qInfo()<< "handleDataReady" << data.at(0);

    m_audioFile.writeAudioData(data);
    // m_fileFactory->setFilePath("/home/gianghandsome/ESCA/data/test.wav");
}

bool RecordingController::recStatus() const
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
