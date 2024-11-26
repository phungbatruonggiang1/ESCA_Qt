#include "audioconfig.h"

AudioConfig::AudioConfig(QObject *parent) : QObject{parent}
{
    int savedDeviceIndex = m_settings.value("audio/device", 0).toInt();  // Load saved device index
    QString savedDeviceName = m_settings.value("audio/deviceName", "default").toString();  // Load saved device name

    m_nearistParams.clear();
    m_nearistParams.append(savedDeviceIndex);
    m_nearistParams.append(m_settings.value("audio/codec", 0).toInt());
    m_nearistParams.append(m_settings.value("audio/sampleRate", 0).toInt());
    m_nearistParams.append(m_settings.value("audio/channel", 0).toInt());
    m_nearistParams.append(m_settings.value("audio/endian", 0).toInt());
    m_nearistParams.append(m_settings.value("audio/sampleSize", 0).toInt());
    m_nearistParams.append(m_settings.value("audio/duration", 0).toInt());

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

    connect(QGuiApplication::instance(), &QGuiApplication::aboutToQuit, this, &AudioConfig::saveSettings);

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
        // m_nearistParams[1] = 0;
    }

    setListSampleRate(m_deviceInfo.supportedSampleRates());
    if (!m_deviceInfo.supportedSampleRates().empty()) {
        m_format.setSampleRate(m_deviceInfo.supportedSampleRates().at(0));
        // m_nearistParams[2] = 0;
    }

    setListChannel(m_deviceInfo.supportedChannelCounts());
    if (!m_deviceInfo.supportedChannelCounts().empty()) {
        m_format.setChannelCount(m_deviceInfo.supportedChannelCounts().at(0));
        // m_nearistParams[3] = 0;
    }

    setListEndianz(m_deviceInfo.supportedByteOrders());
    if (!m_deviceInfo.supportedByteOrders().empty()) {
        m_format.setByteOrder(m_deviceInfo.supportedByteOrders().at(0));
        // m_nearistParams[4] = 0;
    }

    setListSampleSize(m_deviceInfo.supportedSampleSizes());
    if (!m_deviceInfo.supportedSampleSizes().empty()) {
        m_format.setSampleSize(m_deviceInfo.supportedSampleSizes().at(0));
        // m_nearistParams[5] = 0;
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

    // QString iniFilePath = m_settings.fileName();
    // qDebug() << "INI File Path:" << iniFilePath;
    // qInfo()<< "save params c++: " << m_nearistParams;
    // qInfo()<< "is save params true: " << m_deviceInfo.isFormatSupported(m_format);
}

QAudioDeviceInfo AudioConfig::deviceInfo() /*const*/
{
    return m_deviceInfo;
}

QAudioFormat AudioConfig::format() /*const*/
{
    return m_format;
}

QString AudioConfig::duration()
{
    return listDuration().at(m_nearistParams[6]);
}

QList<int> AudioConfig::nearistParams() /*const*/
{
    return m_nearistParams;
}

bool AudioConfig::saveDone() /*const*/
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
    m_settings.setValue("audio/deviceName", m_deviceInfo.deviceName());
    // Lưu các giá trị vào QSettings
    m_settings.setValue("audio/device", m_nearistParams[0]);
    m_settings.setValue("audio/codec", m_nearistParams[1]);
    m_settings.setValue("audio/sampleRate", m_nearistParams[2]);
    m_settings.setValue("audio/channel", m_nearistParams[3]);
    m_settings.setValue("audio/endian", m_nearistParams[4]);
    m_settings.setValue("audio/sampleSize", m_nearistParams[5]);
    m_settings.setValue("audio/duration", m_nearistParams[6]);

    // vì tín hiệu aboutToQuit của QGuiApp khá ngắn nên có lẽ I/O chưa kịp luu file.
    // Mặc định, QSettings lưu trữ các thay đổi trong bộ nhớ
    // và chỉ ghi chúng vào tệp khi cần thiết
    // (khi QSettings bị hủy, hoặc khi ứng dụng kết thúc). Điều này giúp cải thiện hiệu suất, nhưng đôi khi,
    //  bạn muốn đảm bảo rằng các thay đổi được
    //  ghi ngay lập tức để tránh mất dữ liệu khi ứng dụng bị tắt đột ngột
    //  hoặc thời gian tắt không đủ để tự động ghi.

    //Phương thức sync() thực hiện điều này bằng cách:

    //Ép QSettings ghi mọi thay đổi trong bộ nhớ xuống tệp trên đĩa.
    //Đảm bảo rằng tất cả dữ liệu đã được lưu vào tệp trước khi tiếp tục.

    m_settings.sync();

    if (m_settings.status() != QSettings::NoError) {
        qWarning() << "Error occurred while syncing settings to file.";
    } else {
        qInfo() << "Settings saved successfully.";
    }
    qInfo() << "Configuration saved on exit." << m_settings.value("audio/device") <<m_settings.value("audio/sampleSize");
}

