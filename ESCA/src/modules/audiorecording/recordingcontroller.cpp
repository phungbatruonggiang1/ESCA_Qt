#include "recordingcontroller.h"
#include <QDebug>
#include <QTimer>

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
    // m_audioInputEngine->startAudioInput(m_audiochart);

    m_audioConfig = new AudioConfigFile();
    m_audioConfig->setFilePath(RECORDING_CONFIG_FILE);

    // initialize device;
    configValue.clear();
    if(!!m_audioConfig->checkAudioSetuped(configValue)) {
        // qInfo() << "It has configed" << configValue;
        QString inputDevice = configValue[0];
        QString outputDevice = configValue[1];
        QString fileSave = configValue[2];
        int channels = configValue[3].toInt();
        int sampleRate = configValue[4].toInt();
        int resolution = configValue[5].toInt();
        int duration = configValue[6].toInt();
        QString codec = configValue[7];

        // input device
        inputAudioInitialize(inputDevice, codec, channels, sampleRate, resolution);
        m_audioInputEngine->setDuration(duration);
        m_audioInputEngine->setSaveFileLocation(fileSave);

    }
    else {
        qInfo() << "It Hasn't configed";
    }
}


QString RecordingController::getRecordingStatus() const
{
    return recordingStatus;
}

void RecordingController::setRecordingStatus(const QString &newRecordingStatus)
{
    recordingStatus = newRecordingStatus;
}

int RecordingController::inputAudioInitialize(QString inputDeviceName, QString codec, int channels, int sampleRate, int resolution)
{
    QAudioDeviceInfo inputDevice;
    QList<QAudioDeviceInfo> devices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);
    for(int i = 0; i < devices.size(); ++i) {
        // qInfo() << devices.at(i).deviceName();
        if(devices.at(i).deviceName() == inputDeviceName) {
            qInfo() << devices.at(i).deviceName();
            inputDevice = devices[i];
            break;
        }
    }

    if (inputDevice.supportedSampleRates().size() > 0)
    {
        recommendSampleRateBuffer.clear();
        for(int i = 0; i < inputDevice.supportedSampleRates().size(); ++i)
            recommendSampleRateBuffer.append(QString::number(inputDevice.supportedSampleRates().at(i)));
        emit recommendSampleRateBufferChanged();
    }

    if(inputDevice.supportedChannelCounts().size() > 0) {
        recommendChannelBuffer.clear();
        for(int i = 0; i < inputDevice.supportedChannelCounts().size(); ++i)
            recommendChannelBuffer.append(QString::number(inputDevice.supportedChannelCounts().at(i)));
        emit recommendChannelBufferChanged();
    }

    if(inputDevice.supportedSampleSizes().size() > 0) {

        recommendResoultionBuffer.clear();
        for(int i = 0; i < inputDevice.supportedSampleSizes().size(); ++i) {
            recommendResoultionBuffer.append(QString::number(inputDevice.supportedSampleSizes().at(i)));
        }
        emit recommendResoultionChanged();
    }

    if(inputDevice.supportedCodecs().size() > 0) {
        recommendCodecBuffer.clear();
        for(int i = 0; i < inputDevice.supportedCodecs().size(); ++i)
            recommendCodecBuffer.append(inputDevice.supportedCodecs().at(i));
        emit recommendCodecChanged();
    }

    try {
        formatAudioInput.setSampleRate(sampleRate);
        formatAudioInput.setChannelCount(channels);
        formatAudioInput.setSampleSize(resolution);
        formatAudioInput.setCodec(codec);
        formatAudioInput.setByteOrder(QAudioFormat::LittleEndian);
        formatAudioInput.setSampleType(QAudioFormat::UnSignedInt);
    }
    catch(...) {
        qDebug() << "Handling exception not caught in slot.";
    }
    m_audioInputEngine = new InputEngine(inputDevice, formatAudioInput, this);
    m_audioInputEngine->setInputBufferSize(1024);

    return 0;
}


void RecordingController::startRecording()
{
    recordingIO = new RecordingIO(formatAudioInput);
    m_recordingChart = new RecordingChart();
    m_fileFactory = new AudioFileFactory(formatAudioInput);

    connect(recordingIO, &RecordingIO::dataReady, this, &RecordingController::handleDataReady);

    recordingIO->open(QIODevice::WriteOnly);
    m_audioInputEngine->startAudioInput(recordingIO);

    // recordingChart->updateData(this->audioChart());

    qInfo() << "Hi Giang, this is start recording";
}

void RecordingController::stopRecording()
{
    qInfo() << "Hi Giang, this is stop recording";
    // m_timer.stop();
    // m_audioInput->stop();
    // delete m_audioInput;
    // m_audioInput = nullptr;
}

void RecordingController::handleDataReady(const QVector<quint32> &buffer)
{
    // setAudioChart(buffer);
    m_recordingChart->updateData(buffer);

    m_fileFactory->setFilePath("/home/gianghandsome/ESCA/data/test.wav");
    m_fileFactory->saveDataToFile(buffer);

    if (!buffer.isEmpty()) {
        // qInfo() << "buffer controller:" << buffer.at(0);
    } else {
        // qInfo() << "controller is empty";
    }
}

void RecordingController::editRecordParameters(QString device, QString path, int sampleRate, int bitsPerSample, int duration)
{
    // updateAudioPath();
    qInfo() << "Hello Giang";
}

QVector<QString> RecordingController::loadAduioConfigureParameters()
{
    QVector<QString> configValue = m_audioConfig->loadAudioConfigureParameters();
    // m_audioInputEngine->setAudioParameters(configValue);
    return configValue;
}

void RecordingController::saveAduioConfigureParameters(const QVector<QString> &configValue)
{
    m_audioInputEngine->setAudioParameters(configValue);
    m_audioConfig->saveAudioConfigureParameters(configValue);
}


RecordingController::~RecordingController()
{
    m_audioInputEngine->audioInputStop();
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

