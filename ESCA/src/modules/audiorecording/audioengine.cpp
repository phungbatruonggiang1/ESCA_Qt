#include "audioengine.h"
#include <QtMultimedia/QAudioDeviceInfo>
#include <QtMultimedia/QAudioInput>
#include <QtMultimedia/QAudioOutput>
#include <QDebug>


//-----------------------------------------------------------------------------
// Constants
//-----------------------------------------------------------------------------

const qint64 BufferDurationUs       = 10 * 1000000;
const int    NotifyIntervalMs       = 100;

// Size of the level calculation window in microseconds
const int    LevelWindowUs          = 0.1 * 1000000;

//-----------------------------------------------------------------------------
// Constructor and destructor
//-----------------------------------------------------------------------------

AudioEngine::AudioEngine(QAudioDeviceInfo deviceInfoInput, QAudioFormat formatAudioInput, QObject *parent) : QObject{parent}
{
    audioParameters.inputDevice = deviceInfoInput.deviceName();
    audioParameters.duration = 0;
    audioParameters.resolution = formatAudioInput.sampleSize();
    audioParameters.numberOfChannels = formatAudioInput.channelCount();
    audioParameters.sampleRate = formatAudioInput.sampleRate();
    audioParameters.codec = formatAudioInput.codec();
    audioParameters.saveAudioLocation = "";
    m_audioInput = new QAudioInput(deviceInfoInput, formatAudioInput, this);// tạo một obj mới dùng để thu âm thanh từ loa
    // m_audioInput->setBufferSize(1024);  // Đặt độ lớn Buffer

}

AudioEngine::~AudioEngine()
{
    m_audioInput->stop();
}

void AudioEngine::audioInputStop() {
    m_audioInput->stop();
}

// void AudioEngine::startAudioInput(QIODevice *device) {
    // m_audioInput->start(device);
// }

void AudioEngine::setAudioInputDevice(QString device)
{
    audioParameters.inputDevice = device;
}

void AudioEngine::setAudioOutputDevice(const QString device)
{
    // audioParameters.outputDevice = device;
}

void AudioEngine::setAudioParameters(const QVector<QString> &configValue)
{
    QString inputDevice = configValue[0];
    QString outputDevice = configValue[1];
    QString filePath = configValue[2];
    int channels = configValue[3].toInt();
    int sampleRate = configValue[4].toInt();
    int resolution = configValue[5].toInt();
    int duration = configValue[6].toInt();

    audioParameters.inputDevice = inputDevice;
    // audioParameters.outputDevice = outputDevice;
    audioParameters.saveAudioLocation = filePath;
    audioParameters.numberOfChannels = channels;
    audioParameters.sampleRate = sampleRate;
    audioParameters.resolution = resolution;
    audioParameters.duration = duration;

}


QVector<QString> AudioEngine::getsupportedCodecList() const
{
    // for(int i = 0; i < m_inputDevice.supportedCodecs().size(); ++i)
    //     m_supportedCodecList.append(1);
    // return m_supportedCodecList;
}


void AudioEngine::setInputBufferSize(int value) {
    m_audioInput->setBufferSize(value);
}

//void AudioEngine::setAudioInputDevice(const QAudioDeviceInfo &device)
//{
//    if (device.deviceName() != m_audioInputDevice.deviceName()) {
//        m_audioInputDevice = device;
//      initialize();
//    }
//}

//void AudioEngine::setAudioOutputDevice(const QAudioDeviceInfo &device)
//{
//    if (device.deviceName() != m_audioOutputDevice.deviceName()) {
//        m_audioOutputDevice = device;
//    initialize();
//    }
//}
