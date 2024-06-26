#include "inputengine.h"
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

InputEngine::InputEngine(QAudioDeviceInfo deviceInfoInput, QAudioFormat formatAudioInput, QObject *parent) : QObject{parent}
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

InputEngine::~InputEngine()
{
    m_audioInput->stop();
}

void InputEngine::audioInputStop() {
    m_audioInput->stop();
}

void InputEngine::startAudioInput(QIODevice *device)
{
    m_audioInput->start(device);
}


void InputEngine::setAudioInputDevice(QString device)
{
    audioParameters.inputDevice = device;
}

void InputEngine::setAudioOutputDevice(const QString device)
{
    // audioParameters.outputDevice = device;
}

void InputEngine::setAudioParameters(const QVector<QString> &configValue)
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


QVector<QString> InputEngine::getsupportedCodecList() const
{
    // for(int i = 0; i < m_inputDevice.supportedCodecs().size(); ++i)
    //     m_supportedCodecList.append(1);
    // return m_supportedCodecList;
}

QString InputEngine::getSaveFileLocation() const
{
    return saveFileLocation;
}

void InputEngine::setSaveFileLocation(const QString &newSaveFileLocation)
{
    saveFileLocation = newSaveFileLocation;
}

int InputEngine::getDuration() const
{
    return duration;
}

void InputEngine::setDuration(int newDuration)
{
    duration = newDuration;
}


void InputEngine::setInputBufferSize(int value) {
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
