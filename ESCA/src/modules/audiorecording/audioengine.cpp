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

AudioEngine::AudioEngine(QAudioFormat formatAudioInput, QObject *parent) : QObject{parent}
{
    m_availableAudioInputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    m_availableAudioOutputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);
    for (int i = 0; i < m_availableAudioInputDevices.size(); ++i) {
        m_inputDevice.append(m_availableAudioInputDevices.at(i).deviceName());
    }

    for (int i = 0; i < m_availableAudioOutputDevices.size(); ++i) {
        m_outputDevice.append(m_availableAudioOutputDevices.at(i).deviceName());
    }
    m_inputFormat = formatAudioInput;
    // m_audioInput = new QAudioInput(deviceInfoInput, formatAudioInput, this);// tạo một obj mới dùng để thu âm thanh từ loa
    // m_audioInput->setBufferSize(1024);  // Đặt độ lớn Buffer


    // qInfo() << "The input sources: \n";
    // for(int i = 0; i< m_inputDevice.size(); ++i)
    //     qInfo() << m_inputDevice.at(i) << "\n";

    // qInfo() << "The output sources: \n";
    // for(int i = 0; i< m_outputDevice.size(); ++i)
    //     qInfo() << m_outputDevice.at(i) << "\n";
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
    // m_availableAudioInputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    // for(int i = 0; i < m_availableAudioInputDevices.size(); ++i) {
    //     if(device == m_availableAudioInputDevices.at(i).deviceName()) {
    //         m_audioInput->~QAudioInput();
    //         // m_audioInput = new QAudioInput(m_availableAudioInputDevices.at(i), m_inputFormat, this);
    //         m_audioInput->setBufferSize(1024);
    //         break;
    //     }
    // }
}

void AudioEngine::setAudioOutputDevice(const QString device)
{
    audioParameters.outputDevice = device;
    m_availableAudioOutputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);
    for(int i = 0; i < m_availableAudioOutputDevices.size(); ++i) {
        if(device == m_availableAudioOutputDevices.at(i).deviceName()) {
            m_audioOutput->~QAudioOutput();
            // m_audioOutput = new QAudioOutput(m_availableAudioOutputDevices.at(i), m_inputFormat, this);
            break;
        }
    }
}

void AudioEngine::setAudioParameters(const QVector<QString> &configValue)
{
    QString inputDevice = configValue[0];
    QString outputDevice = configValue[1];
    QString filePath = configValue[2];
    int channels = configValue[3].toInt();
    int sampleRate = configValue[4].toInt();
    int resolution = configValue[5].toInt();

    audioParameters.inputDevice = inputDevice;
    audioParameters.outputDevice = outputDevice;
    audioParameters.saveAudioLocation = filePath;
    audioParameters.numberOfChannels = channels;
    audioParameters.sampleRate = sampleRate;
    audioParameters.resolution = resolution;

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
