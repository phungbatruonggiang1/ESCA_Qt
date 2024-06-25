#include "audioengine.h"
#include <QtMultimedia/QAudioDeviceInfo>
#include <QtMultimedia/QAudioInput>
#include <QtMultimedia/QAudioOutput>
#include <QDebug>
#include <QTimer>


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

    // qInfo() << deviceInfoInput.supportedSampleRates();
    // qInfo() << deviceInfoInput.supportedChannelCounts();
    // qInfo() << deviceInfoInput.supportedSampleSizes();


    audioParameters.inputDevice = deviceInfoInput.deviceName();
    audioParameters.resolution = formatAudioInput.sampleSize();
    audioParameters.numberOfChannels = formatAudioInput.channelCount();
    audioParameters.sampleRate = formatAudioInput.sampleRate();
    audioParameters.codec = formatAudioInput.codec();
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

void AudioEngine::startAudioInput(QIODevice *device)
{
    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, device::writeBufferToFile);
    timer->start(1000);
    m_audioInput->start(device);
}


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
    int durationFile = configValue[6].toInt();

    audioParameters.inputDevice = inputDevice;
    // audioParameters.outputDevice = outputDevice;
    saveFileLocation = filePath;
    audioParameters.numberOfChannels = channels;
    audioParameters.sampleRate = sampleRate;
    audioParameters.resolution = resolution;
    duration = durationFile;

}


QVector<QString> AudioEngine::getsupportedCodecList() const
{
    // for(int i = 0; i < m_inputDevice.supportedCodecs().size(); ++i)
    //     m_supportedCodecList.append(1);
    // return m_supportedCodecList;
}

QString AudioEngine::getSaveFileLocation() const
{
    return saveFileLocation;
}

void AudioEngine::setSaveFileLocation(const QString &newSaveFileLocation)
{
    saveFileLocation = newSaveFileLocation;
}

int AudioEngine::getDuration() const
{
    return duration;
}

void AudioEngine::setDuration(int newDuration)
{
    duration = newDuration;
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
