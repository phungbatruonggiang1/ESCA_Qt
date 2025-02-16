// ConfigurationManager.cpp
#include "configurationmanager.h"
#include <QDebug>
#include <QStandardPaths>
#include <QDir>

ConfigurationManager::ConfigurationManager(QObject *parent) : QObject(parent),
    m_transferLearning(false),
    m_logPath("/home/haiminh/Desktop/rt_test_results"),
    m_manualThreshold(0.0026),
    m_runtime(1000),
    m_deviceIndexInput(12),
    m_second(2),
    m_channels(1),
    m_samplingRate(44100),
    m_importFile(false)
{
    m_filePath = QStandardPaths::writableLocation(QStandardPaths::HomeLocation) + QDir::separator() + "config.json";
}

ConfigurationManager::~ConfigurationManager()
{
}

bool ConfigurationManager::loadConfig() {
    QFile file(m_filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file cấu hình:" << m_filePath;
        loadDefaults(); // Sử dụng giá trị mặc định nếu không mở được file
        return false;
    }

    QByteArray data = file.readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data);

    if (doc.isNull() || !doc.isObject()) {
        qWarning() << "File cấu hình không hợp lệ (không phải JSON object).";
        loadDefaults(); // Sử dụng giá trị mặc định nếu file JSON không hợp lệ
        return false;
    }

    // Lưu toàn bộ cấu hình
    QJsonObject m_fullConfig = doc.object();

    // Kiểm tra và cập nhật các tham số trong phần REALTIME
    if (m_fullConfig.contains("REALTIME") && m_fullConfig["REALTIME"].isObject()) {
        QJsonObject realtimeConfig = m_fullConfig["REALTIME"].toObject();

        // Cập nhật từng tham số (nếu thiếu thì bổ sung mặc định)
        m_transferLearning = realtimeConfig.value("TRANSFER_LEARNING").toBool(false);
        m_logPath = realtimeConfig.value("LOG_PATH").toString("/default/log/path");
        m_manualThreshold = realtimeConfig.value("MANUAL_THRESHOLD").toDouble(0.01);
        m_runtime = realtimeConfig.value("RUNTIME").toInt(1000);
        m_deviceIndexInput = realtimeConfig.value("DEVICE_INDEX_INPUT").toInt(0);
        m_second = realtimeConfig.value("SECOND").toInt(5);
        m_channels = realtimeConfig.value("CHANNELS").toInt(1);
        m_samplingRate = realtimeConfig.value("SAMPLING_RATE").toInt(44100);
        m_importFile = realtimeConfig.value("IMPORT_FILE").toBool(false);

        qDebug() << "Đã cập nhật các tham số REALTIME từ file cấu hình.";
    } else {
        qWarning() << "Phần REALTIME không tồn tại trong file cấu hình. Sử dụng giá trị mặc định.";
        loadDefaults(); // Chỉ tải giá trị mặc định cho phần REALTIME
    }
    return true;
}

bool ConfigurationManager::saveConfig() const {
    QFile file(m_filePath);
    QJsonObject rootObject;
    if (file.exists()) {
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << "Không thể mở file cấu hình để đọc:" << m_filePath;
            return false;
        }

        QByteArray data = file.readAll();
        QJsonDocument doc = QJsonDocument::fromJson(data);

        if (!doc.isNull() && doc.isObject()) {
            rootObject = doc.object();
        }

        file.close();
    }

    // Cập nhật phần REALTIME
    QJsonObject realtimeConfig;
    realtimeConfig["TRANSFER_LEARNING"] = m_transferLearning;
    realtimeConfig["LOG_PATH"] = m_logPath;
    realtimeConfig["MANUAL_THRESHOLD"] = m_manualThreshold;
    realtimeConfig["RUNTIME"] = m_runtime;
    realtimeConfig["DEVICE_INDEX_INPUT"] = m_deviceIndexInput;
    realtimeConfig["SECOND"] = m_second;
    realtimeConfig["CHANNELS"] = m_channels;
    realtimeConfig["SAMPLING_RATE"] = m_samplingRate;
    realtimeConfig["IMPORT_FILE"] = m_importFile;

    rootObject["REALTIME"] = realtimeConfig; // Ghi đè hoặc thêm phần REALTIME

    // Ghi lại file JSON
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file cấu hình để ghi:" << m_filePath;
        return false;
    }

    QJsonDocument doc(rootObject);
    file.write(doc.toJson());
    file.close();
    qDebug() << "Đã lưu cấu hình đầy đủ thành công.";
    return true;
}

// Getters
bool ConfigurationManager::transferLearning() const { return m_transferLearning; }
QString ConfigurationManager::logPath() const { return m_logPath; }
double ConfigurationManager::manualThreshold() const { return m_manualThreshold; }
int ConfigurationManager::runtime() const { return m_runtime; }
int ConfigurationManager::deviceIndexInput() const { return m_deviceIndexInput; }
int ConfigurationManager::second() const { return m_second; }
int ConfigurationManager::channels() const { return m_channels; }
int ConfigurationManager::samplingRate() const { return m_samplingRate; }
bool ConfigurationManager::importFile() const { return m_importFile; }

// Setters
void ConfigurationManager::setTransferLearning(bool transferLearning)
{
    if (m_transferLearning != transferLearning) {
        m_transferLearning = transferLearning;
        emit transferLearningChanged();
    }
}

void ConfigurationManager::setLogPath(const QString &logPath)
{
    if (m_logPath != logPath) {
        m_logPath = logPath;
        emit logPathChanged();
    }
}

void ConfigurationManager::setManualThreshold(double manualThreshold)
{
    if (m_manualThreshold != manualThreshold) {
        m_manualThreshold = manualThreshold;
        emit manualThresholdChanged();
    }
}

void ConfigurationManager::setRuntime(int runtime)
{
    if (m_runtime != runtime) {
        m_runtime = runtime;
        emit runtimeChanged();
    }
}

void ConfigurationManager::setDeviceIndexInput(int deviceIndexInput)
{
    if (m_deviceIndexInput != deviceIndexInput) {
        m_deviceIndexInput = deviceIndexInput;
        emit deviceIndexInputChanged();
    }
}

void ConfigurationManager::setSecond(int second)
{
    if (m_second != second) {
        m_second = second;
        emit secondChanged();
    }
}

void ConfigurationManager::setChannels(int channels)
{
    if (m_channels != channels) {
        m_channels = channels;
        emit channelsChanged();
    }
}

void ConfigurationManager::setSamplingRate(int samplingRate)
{
    if (m_samplingRate != samplingRate) {
        m_samplingRate = samplingRate;
        emit samplingRateChanged();
    }
}

void ConfigurationManager::setImportFile(bool importFile)
{
    if (m_importFile != importFile) {
        m_importFile = importFile;
        emit importFileChanged();
    }
}

void ConfigurationManager::loadDefaults()
{
    // Giá trị mặc định đã được khởi tạo trong constructor
    qDebug() << "Đã tải các giá trị mặc định cho REALTIME.";
}

void ConfigurationManager::applyConfig(const QJsonObject& realtime)
{
    if (realtime.contains("TRANSFER_LEARNING") && realtime["TRANSFER_LEARNING"].isBool()) {
        setTransferLearning(realtime["TRANSFER_LEARNING"].toBool());
    }

    if (realtime.contains("LOG_PATH") && realtime["LOG_PATH"].isString()) {
        setLogPath(realtime["LOG_PATH"].toString());
    }

    if (realtime.contains("MANUAL_THRESHOLD") && realtime["MANUAL_THRESHOLD"].isDouble()) {
        setManualThreshold(realtime["MANUAL_THRESHOLD"].toDouble());
    }

    if (realtime.contains("RUNTIME") && realtime["RUNTIME"].isDouble()) {
        setRuntime(realtime["RUNTIME"].toInt());
    }

    if (realtime.contains("DEVICE_INDEX_INPUT") && realtime["DEVICE_INDEX_INPUT"].isDouble()) {
        setDeviceIndexInput(realtime["DEVICE_INDEX_INPUT"].toInt());
    }

    if (realtime.contains("SECOND") && realtime["SECOND"].isDouble()) {
        setSecond(realtime["SECOND"].toInt());
    }

    if (realtime.contains("CHANNELS") && realtime["CHANNELS"].isDouble()) {
        setChannels(realtime["CHANNELS"].toInt());
    }

    if (realtime.contains("SAMPLING_RATE") && realtime["SAMPLING_RATE"].isDouble()) {
        setSamplingRate(realtime["SAMPLING_RATE"].toInt());
    }

    if (realtime.contains("IMPORT_FILE") && realtime["IMPORT_FILE"].isBool()) {
        setImportFile(realtime["IMPORT_FILE"].toBool());
    }
}

QJsonObject ConfigurationManager::generateConfig() const
{
    QJsonObject realtimeObj;
    realtimeObj["TRANSFER_LEARNING"] = m_transferLearning;
    realtimeObj["LOG_PATH"] = m_logPath;
    realtimeObj["MANUAL_THRESHOLD"] = m_manualThreshold;
    realtimeObj["RUNTIME"] = m_runtime;
    realtimeObj["DEVICE_INDEX_INPUT"] = m_deviceIndexInput;
    realtimeObj["SECOND"] = m_second;
    realtimeObj["CHANNELS"] = m_channels;
    realtimeObj["SAMPLING_RATE"] = m_samplingRate;
    realtimeObj["IMPORT_FILE"] = m_importFile;

    return realtimeObj;
}
