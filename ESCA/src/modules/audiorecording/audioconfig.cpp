#include "audioconfig.h"

AudioConfig::AudioConfig(QObject *parent) : QObject{parent}
{
    QFile configFile("/home/haiminh/Desktop/ESCA_Qt/ESCA/database/recording_params.json");

    if (configFile.open(QIODevice::ReadOnly)) {
        QByteArray data = configFile.readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data);

        if (jsonDoc.isObject()) {
            QJsonObject json = jsonDoc.object();
            int savedDeviceIndex = json.value("device").toInt();  // Load saved device index
            QString savedDeviceName = json.value("deviceName").toString("default");  // Load saved device name

            // qDebug() << "audio: "<<savedDeviceName;
            // int savedDeviceIndex = m_settings.value("audio/device", 0).toInt();
            // QString savedDeviceName = m_settings.value("audio/deviceName", "default").toString();

            m_nearistParams.clear();
            m_nearistParams.append(savedDeviceIndex);
            m_nearistParams.append(json.value("codec").toInt());
            m_nearistParams.append(json.value("sampleRate").toInt());
            m_nearistParams.append(json.value("channel").toInt());
            m_nearistParams.append(json.value("endian").toInt());
            m_nearistParams.append(json.value("sampleSize").toInt());
            m_nearistParams.append(json.value("duration").toInt());

            emit nearistParamsChanged();

            qInfo() << "m_nearistParams: "<<m_nearistParams;

            for (auto &deviceInfo : QAudioDeviceInfo::availableDevices(QAudio::AudioInput)) {
                cpplistDevices.append(deviceInfo);
                m_listDevices.append(deviceInfo.deviceName());
                // emit listDevicesChanged();
                // qDebug() << m_listDevices.length();
            }
            qDebug() << m_listDevices.length();

            for (auto &outputInfo : QAudioDeviceInfo::availableDevices(QAudio::AudioOutput)) {
                cpplistOutput.append(outputInfo);
                m_listOutput.append(outputInfo.deviceName());
                // qDebug() << deviceInfo.deviceName();
            }

            // Check if the device index is valid and if the name matches the saved one
            if (savedDeviceIndex >= 0 && savedDeviceIndex < cpplistDevices.size() &&
                cpplistDevices[savedDeviceIndex].deviceName() == savedDeviceName) {
                m_deviceInfo = cpplistDevices[savedDeviceIndex];
            } else {
                // If device index is invalid or device name doesn't match, find the device by name
                bool found = false;
                for (const auto &device : cpplistDevices) {
                    if (device.deviceName() == savedDeviceName) {
                        m_deviceInfo = device;
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    m_deviceInfo = cpplistDevices.first();  // Default to the first device if no match found
                }
            }
        } else {
            qWarning() << "Failed to load configuration from JSON.";
        }
        configFile.close();
    } else {
        qWarning() << "Failed to open configuration file.";
    }

    m_format.setCodec(m_deviceInfo.supportedCodecs().at(m_nearistParams[1]));
    m_format.setSampleRate(m_deviceInfo.supportedSampleRates().at(m_nearistParams[2]));
    m_format.setChannelCount(m_deviceInfo.supportedChannelCounts().at(m_nearistParams[3]));
    m_format.setByteOrder(m_deviceInfo.supportedByteOrders().at(m_nearistParams[4]));
    m_format.setSampleSize(m_deviceInfo.supportedSampleSizes().at(m_nearistParams[5]));
    m_format.setSampleType(QAudioFormat::SignedInt);

    setListDevices(m_listDevices);
    setListSampleRate(m_deviceInfo.supportedSampleRates());
    setListChannel(m_deviceInfo.supportedChannelCounts());
    setListCodecs(m_deviceInfo.supportedCodecs());
    setListEndianz(m_deviceInfo.supportedByteOrders());
    setListSampleSize(m_deviceInfo.supportedSampleSizes());

    connect(QGuiApplication::instance(), &QGuiApplication::aboutToQuit, this, &AudioConfig::saveSettings);  // lưu vào file json trước khi tắt app

    qInfo() << "Initialized m_nearistParams from settings:" << m_nearistParams << m_deviceInfo.supportedSampleSizes();
    qInfo() << "m_format: "<<m_format << m_format.sampleSize();
}

AudioConfig::~AudioConfig()
{

}

void AudioConfig::changeDevice(int idx)
{
    if (cpplistDevices.empty()) {
        qWarning() <<  "no device found";
        return;
    }

    m_deviceInfo = cpplistDevices[idx];
    m_nearistParams[0] = idx;  // Cập nhật index thiết bị

    setListCodecs(m_deviceInfo.supportedCodecs());
    if (!m_deviceInfo.supportedCodecs().empty()) {
        m_format.setCodec(m_deviceInfo.supportedCodecs().at(0));        
    }

    setListSampleRate(m_deviceInfo.supportedSampleRates());
    if (!m_deviceInfo.supportedSampleRates().empty()) {
        m_format.setSampleRate(m_deviceInfo.supportedSampleRates().at(0));        
    }

    setListChannel(m_deviceInfo.supportedChannelCounts());
    if (!m_deviceInfo.supportedChannelCounts().empty()) {
        m_format.setChannelCount(m_deviceInfo.supportedChannelCounts().at(0));        
    }

    setListEndianz(m_deviceInfo.supportedByteOrders());
    if (!m_deviceInfo.supportedByteOrders().empty()) {
        m_format.setByteOrder(m_deviceInfo.supportedByteOrders().at(0));        
    }

    setListSampleSize(m_deviceInfo.supportedSampleSizes());
    if (!m_deviceInfo.supportedSampleSizes().empty()) {
        m_format.setSampleSize(m_deviceInfo.supportedSampleSizes().at(0));
    }
}

QStringList AudioConfig::listDevices() const
{
    return m_listDevices;
}
void AudioConfig::setListDevices(const QStringList &newListDevices)
{
    if (m_listDevices == newListDevices)
        return;
    m_listDevices = newListDevices;
    emit listDevicesChanged();
}

QStringList AudioConfig::listOutput() const
{
    return m_listOutput;
}

void AudioConfig::setListOutput(const QStringList &newListOutput)
{
    if (m_listOutput == newListOutput)
        return;
    m_listOutput = newListOutput;
    emit listOutputChanged();
}

QList<int> AudioConfig::listSampleRate() const
{
    return m_listSampleRate;
}
void AudioConfig::setListSampleRate(const QList<int> &newListSampleRate)
{
    if (m_listSampleRate == newListSampleRate)
        return;
    m_listSampleRate = newListSampleRate;
    emit listSampleRateChanged();
}

QList<int> AudioConfig::listChannel() const
{
    return m_listChannel;
}
void AudioConfig::setListChannel(const QList<int> &newListChannel)
{
    if (m_listChannel == newListChannel)
        return;
    m_listChannel = newListChannel;
    emit listChannelChanged();
}

QStringList AudioConfig::listCodecs() const
{
    return m_listCodecs;
}
void AudioConfig::setListCodecs(const QStringList &newListCodecs)
{
    if (m_listCodecs == newListCodecs)
        return;
    m_listCodecs = newListCodecs;
    emit listCodecsChanged();
}

QList<QAudioFormat::Endian> AudioConfig::listEndianz() const
{
    return m_listEndianz;
}

void AudioConfig::setListEndianz(const QList<QAudioFormat::Endian> &newListEndianz)
{
    if (m_listEndianz == newListEndianz)
        return;
    m_listEndianz = newListEndianz;
    emit listEndianzChanged();
}

QList<int> AudioConfig::listSampleSize() const
{
    return m_listSampleSize;
}

void AudioConfig::setListSampleSize(const QList<int> &newListSampleSize)
{
    if (m_listSampleSize == newListSampleSize)
        return;
    m_listSampleSize = newListSampleSize;
    emit listSampleSizeChanged();
}

QStringList AudioConfig::listDuration() const
{
    return m_listDuration;
}

void AudioConfig::saveConfig(int device, int codec, int sampleRate, int channel, int endian, int sampleSize, int duration)
{
    m_nearistParams = {device, codec, sampleRate, channel, endian, sampleSize, duration};

    qInfo()<< "save params qml: " << m_nearistParams;

    // int checkVar = 0;
    m_deviceInfo = cpplistDevices[device];
    m_format.setSampleRate(listSampleRate().at(sampleRate));
    m_format.setChannelCount(listChannel().at(channel));
    m_format.setByteOrder(listEndianz().at(endian));
    m_format.setSampleSize(listSampleSize().at(sampleSize));
    m_format.setSampleType(QAudioFormat::SignedInt);

    if (!m_deviceInfo.isFormatSupported(m_format)) {

        setSaveDone(false);

        qWarning() << "Default format not supported - use nearist format";
        m_format = m_deviceInfo.nearestFormat(m_format);

        m_nearistParams[1] = m_deviceInfo.supportedCodecs().indexOf(m_format.codec());
        m_nearistParams[2] = m_deviceInfo.supportedSampleRates().indexOf(m_format.sampleRate());
        m_nearistParams[3] = m_deviceInfo.supportedChannelCounts().indexOf(m_format.channelCount());
        m_nearistParams[4] = m_deviceInfo.supportedByteOrders().indexOf(m_format.byteOrder());
        m_nearistParams[5] = m_deviceInfo.supportedSampleSizes().indexOf(m_format.sampleSize());
        emit nearistParamsChanged();
    }
    // saveSettings();
}

QAudioDeviceInfo AudioConfig::deviceInfo()
{
    return m_deviceInfo;
}

QAudioFormat AudioConfig::format()
{
    return m_format;
}

QString AudioConfig::duration()
{
    return listDuration().at(m_nearistParams[6]);
}

QList<int> AudioConfig::nearistParams()
{
    return m_nearistParams;
}

bool AudioConfig::saveDone()
{
    return m_saveDone;
}

void AudioConfig::setSaveDone(bool newSaveDone)
{
    if (m_saveDone == newSaveDone)
        return;
    m_saveDone = newSaveDone;
    emit saveDoneChanged();
}

void AudioConfig::saveSettings()
{
    QJsonObject json;

    // Save all parameters to the JSON object
    json["device"] = m_nearistParams[0];
    json["codec"] = m_nearistParams[1];
    json["sampleRate"] = m_nearistParams[2];
    json["channel"] = m_nearistParams[3];
    json["endian"] = m_nearistParams[4];
    json["sampleSize"] = m_nearistParams[5];
    json["duration"] = m_nearistParams[6];
    json["deviceName"] = m_deviceInfo.deviceName();

    QJsonDocument jsonDoc(json);

    qDebug()<< json << "dev name: "<<json["deviceName"];

    QFile configFile("/home/haiminh/Desktop/ESCA_Qt/ESCA/database/recording_params.json");
    if (configFile.open(QIODevice::WriteOnly)) {
        configFile.write(jsonDoc.toJson());
        configFile.close();
        qInfo() << "Settings saved successfully.";
    } else {
        qWarning() << "Failed to open config file for saving.";
    }
}

