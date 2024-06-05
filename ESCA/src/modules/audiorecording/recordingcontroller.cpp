#include "recordingcontroller.h"
#include <QDebug>

RecordingController::RecordingController(QObject *parent) : QObject{parent}
{

    QVector<QString> configValue;

    QList<QAudioDeviceInfo> m_availableAudioInputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    QList<QAudioDeviceInfo> m_availableAudioOutputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);
    for (int i = 0; i < m_availableAudioInputDevices.size(); ++i) {
        m_inputDevice.append(m_availableAudioInputDevices.at(i).deviceName());
    }

    for (int i = 0; i < m_availableAudioOutputDevices.size(); ++i) {
        m_outputDevice.append(m_availableAudioOutputDevices.at(i).deviceName());
    }
    // qInfo() << m_inputDevice;
    // khoi tạo một obj mới dùng để thu âm thanh từ loa
    // m_audioChart = new RecordingChart();
    // m_audiochart->open(QIODevice::WriteOnly);
    // m_audioEngine->startAudioInput(m_audiochart);


    m_audioConfig = new AudioConfigFile();
    m_audioConfig->setFilePath(RECORDING_CONFIG_FILE);



    // initialize device;
    configValue.clear();
    if(!!m_audioConfig->checkAudioSetuped(configValue)) {
        // qInfo() << "It has configed" << configValue;


        // input device


    }
    else {
        qInfo() << "It Hasn't configed";
    }

}






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

QVector<QString> RecordingController::getRecommendSampleRateBuffer() const
{
    return recommendSampleRateBuffer;
}

QVector<QString> RecordingController::getRecommendChannelBuffer() const
{
    return recommendChannelBuffer;
}

QVector<QString> RecordingController::getRecommendResoultionBuffer() const
{
    return recommendResoultionBuffer;
}

QVector<QString> RecordingController::getRecommendCodecBuffer() const
{
    return recommendCodecBuffer;
}

QString RecordingController::getRecordingStatus() const
{
    return recordingStatus;
}

void RecordingController::setRecordingStatus(const QString &newRecordingStatus)
{
    recordingStatus = newRecordingStatus;
}

int RecordingController::InputAudioInitialize(QString inputDeviceName, QString codec, int channels, int sampleRate, int resolution)
{
    QAudioDeviceInfo inputDevice = QAudioDeviceInfo::defaultInputDevice();
    QList<QAudioDeviceInfo> devices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    for(int i = 0; i < devices.size(); ++i) {
        // qInfo() << devices.at(i).deviceName();
        if(devices.at(i).deviceName() == inputDeviceName) {
            qInfo() << devices.at(i).deviceName();
            inputDevice = devices[i];
            break;
        }
    }
    if (inputDevice.supportedSampleRates().size() > 0
        && inputDevice.supportedChannelCounts().size() > 0
        && inputDevice.supportedSampleSizes().size() > 0
        && inputDevice.supportedCodecs().size() > 0)
    {
        for(int i = 0; i < inputDevice.supportedSampleRates().size(); ++i) {
            recommendSampleRateBuffer.append(QString::number(inputDevice.supportedSampleRates().at(i)));
        }

        for(int i = 0; i < inputDevice.supportedChannelCounts().size(); ++i) {
            recommendChannelBuffer.append(QString::number(inputDevice.supportedChannelCounts().at(i)));
        }


        for(int i = 0; i < inputDevice.supportedSampleSizes().size(); ++i) {
            recommendResoultionBuffer.append(QString::number(inputDevice.supportedSampleSizes().at(i)));
        }


        for(int i = 0; i < inputDevice.supportedCodecs().size(); ++i) {
            recommendCodecBuffer.append(inputDevice.supportedCodecs().at(i));
        }

    }


    QAudioFormat formatAudio;
    try {
        formatAudio.setSampleRate(sampleRate);
        formatAudio.setChannelCount(channels);
        formatAudio.setSampleSize(resolution);
        formatAudio.setCodec(codec);
        formatAudio.setByteOrder(QAudioFormat::LittleEndian);
        formatAudio.setSampleType(QAudioFormat::UnSignedInt);
    }
    catch(...) {
        qDebug() << "Handling exception not caught in slot.";
    }
    m_audioEngine = new AudioEngine(inputDevice, formatAudio, this);
    m_audioEngine->setInputBufferSize(1024);

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
   // m_audioEngine->setAudioParameters(configValue);
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
    return m_inputDevice;
}

QVector<QString> RecordingController::getOutputAudioDeviceList()
{
    return m_outputDevice;
}

void RecordingController::setInputAudioDevice(QString device)
{
    qInfo() << "The input is: " << device;
}

void RecordingController::setOutputAudioDevice(QString device)
{
    qInfo() << "The output is: " << device;
}
