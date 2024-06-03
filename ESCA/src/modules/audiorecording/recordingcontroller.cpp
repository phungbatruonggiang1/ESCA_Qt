#include "recordingcontroller.h"
#include <QtMultimedia/QAudioDeviceInfo>
#include <QtMultimedia/QAudioInput>
#include <QDebug>

RecordingController::RecordingController(QObject *parent) : QObject{parent}
{

    QList<QAudioDeviceInfo> devices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    // for(int i = 0; i < devices.size(); ++i) {
    //     qInfo() << devices.at(i).deviceName();
    // }

    // QAudioDeviceInfo inputDevice = devices.at(devices.size() - 1);
    QAudioDeviceInfo inputDevice = QAudioDeviceInfo::defaultInputDevice();
    if (inputDevice.supportedSampleRates().size() > 0
        && inputDevice.supportedChannelCounts().size() > 0
        && inputDevice.supportedSampleSizes().size() > 0        //Kiem tra cac dieu kien xem co thoa man
        && inputDevice.supportedCodecs().size() > 0)
    {
        // cau hinh cac thong so do am thanh
        QAudioFormat formatAudio;
        formatAudio.setSampleRate(inputDevice.supportedSampleRates().at(0));
        formatAudio.setChannelCount(inputDevice.supportedChannelCounts().at(0));
        formatAudio.setSampleSize(inputDevice.supportedSampleSizes().at(0));
        formatAudio.setCodec(inputDevice.supportedCodecs().at(0));
        formatAudio.setByteOrder(QAudioFormat::LittleEndian);
        formatAudio.setSampleType(QAudioFormat::UnSignedInt);

        // khoi tạo một obj mới dùng để thu âm thanh từ loa
        m_audioEngine = new AudioEngine(formatAudio, this);
        // m_audioEngine->setInputBufferSize(1024);
        // m_audioChart = new RecordingChart();
        // m_audiochart->open(QIODevice::WriteOnly);
        // m_audioEngine->startAudioInput(m_audiochart);
        m_audioConfig = new AudioConfigFile();
    }

}

// void RecordingController::updateAudioPath() {
    // QVector<QString> result = m_audioConfig->loadConfig();
    // qInfo() << result;
// }

QVector<float> RecordingController::getBufferChart() const
{
    return m_bufferChart;
}

void RecordingController::setbufferChart(const QVector<float> &newBufferData)
{
    if (m_bufferChart == newBufferData)
        return;
    m_bufferChart = newBufferData;

    emit bufferChartChanged();
}

QString RecordingController::getRecordingStatus() const
{
    return recordingStatus;
}

void RecordingController::setRecordingStatus(const QString &newRecordingStatus)
{
    recordingStatus = newRecordingStatus;
}

void RecordingController::startRecording()
{

}

void RecordingController::stopRecording()
{

}

void RecordingController::editRecordParameters(QString device, QString path, int sampleRate, int bitsPerSample, int duration)
{
    // updateAudioPath();
    qInfo() << "Hello Giang";

}

QVector<QString> RecordingController::loadAduioConfigureParameters()
{
   QVector<QString> configValue = m_audioConfig->loadAudioConfigureParameters();
   m_audioEngine->setAudioParameters(configValue);
   return configValue;
}

void RecordingController::saveAduioConfigureParameters(const QVector<QString> &configValue)
{
    m_audioEngine->setAudioParameters(configValue);
    m_audioConfig->saveAudioConfigureParameters(configValue);
}


RecordingController::~RecordingController()
{
    m_audioEngine->audioInputStop();
}

QVector<QString> RecordingController::getInputAudioDeviceList()
{
    return m_audioEngine->availableAudioInputDevices();
}

QVector<QString> RecordingController::getOutputAudioDeviceList()
{
    return m_audioEngine->availableAudioOutputDevices();
}

void RecordingController::setInputAudioDevice(QString device)
{
    qInfo() << "The input is: " << device;
}

void RecordingController::setOutputAudioDevice(QString device)
{
    qInfo() << "The output is: " << device;
}
