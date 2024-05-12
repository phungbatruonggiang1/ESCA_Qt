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

AudioEngine::AudioEngine(const QAudioDeviceInfo &deviceInfoInput, QAudioFormat formatAudioInput, QObject *parent) : QObject{parent}
{
    QVector<QString> m_inputDevice;
    m_availableAudioInputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    m_availableAudioOutputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);
    for (int i = 0; i < m_availableAudioInputDevices.size(); ++i) {

        //        qDebug() << "Input: " << inputDeviceList.at(i).deviceName();
        m_inputDevice.append(m_availableAudioInputDevices.at(i).deviceName());
    }


    // for(int i =0; i < m_inputDevice.size(); ++i) {
    //            qDebug() << "Input Giang: " << m_inputDevice[i];

    // }


    m_audioInput = new QAudioInput(deviceInfoInput, formatAudioInput, this);// tạo một obj mới dùng để thu âm thanh từ loa
    m_audioInput->setBufferSize(1024);  // Đặt độ lớn Buffer

}

AudioEngine::~AudioEngine()
{
    m_audioInput->stop();
}

void AudioEngine::audioInputStop() {
    m_audioInput->stop();
}

void AudioEngine::startAudioInput(QIODevice *device) {
    m_audioInput->start(device);
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
