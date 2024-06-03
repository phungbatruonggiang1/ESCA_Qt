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
    // khoi tạo một obj mới dùng để thu âm thanh từ loa
    // m_audioEngine = new AudioEngine(formatAudio, this);
    // m_audioEngine->setInputBufferSize(1024);
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
        QAudioDeviceInfo inputDevice = QAudioDeviceInfo::defaultInputDevice();
        QString inputDeviceName = configValue[0];
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
            && inputDevice.supportedSampleSizes().size() > 0        //Kiem tra cac dieu kien xem co thoa man
            && inputDevice.supportedCodecs().size() > 0)
        {
            // cau hinh cac thong so do am thanh, tam the da nhe
            QAudioFormat formatAudio;
            formatAudio.setSampleRate(inputDevice.supportedSampleRates().at(0));
            formatAudio.setChannelCount(inputDevice.supportedChannelCounts().at(0));
            formatAudio.setSampleSize(inputDevice.supportedSampleSizes().at(0));
            formatAudio.setCodec(inputDevice.supportedCodecs().at(0));
            formatAudio.setByteOrder(QAudioFormat::LittleEndian);
            formatAudio.setSampleType(QAudioFormat::UnSignedInt);

        }



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
