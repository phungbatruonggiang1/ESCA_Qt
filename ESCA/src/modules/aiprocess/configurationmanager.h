// ConfigurationManager.h
#ifndef CONFIGURATIONMANAGER_H
#define CONFIGURATIONMANAGER_H

#include <QObject>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>

class ConfigurationManager : public QObject
{
    Q_OBJECT
    // Các thuộc tính của phần REALTIME
    Q_PROPERTY(bool transferLearning READ transferLearning WRITE setTransferLearning NOTIFY transferLearningChanged)
    Q_PROPERTY(QString logPath READ logPath WRITE setLogPath NOTIFY logPathChanged)
    Q_PROPERTY(double manualThreshold READ manualThreshold WRITE setManualThreshold NOTIFY manualThresholdChanged)
    Q_PROPERTY(int runtime READ runtime WRITE setRuntime NOTIFY runtimeChanged)
    Q_PROPERTY(int deviceIndexInput READ deviceIndexInput WRITE setDeviceIndexInput NOTIFY deviceIndexInputChanged)
    Q_PROPERTY(int second READ second WRITE setSecond NOTIFY secondChanged)
    Q_PROPERTY(int channels READ channels WRITE setChannels NOTIFY channelsChanged)
    Q_PROPERTY(int samplingRate READ samplingRate WRITE setSamplingRate NOTIFY samplingRateChanged)
    Q_PROPERTY(bool importFile READ importFile WRITE setImportFile NOTIFY importFileChanged)

public:
    explicit ConfigurationManager(QObject *parent = nullptr);
    ~ConfigurationManager();

    // Getters
    bool transferLearning() const;
    QString logPath() const;
    double manualThreshold() const;
    int runtime() const;
    int deviceIndexInput() const;
    int second() const;
    int channels() const;
    int samplingRate() const;
    bool importFile() const;

    // Setters
    void setTransferLearning(bool transferLearning);
    void setLogPath(const QString &logPath);
    void setManualThreshold(double manualThreshold);
    void setRuntime(int runtime);
    void setDeviceIndexInput(int deviceIndexInput);
    void setSecond(int second);
    void setChannels(int channels);
    void setSamplingRate(int samplingRate);
    void setImportFile(bool importFile);

    // Phương thức tải và lưu cấu hình
    Q_INVOKABLE bool loadConfig();
    Q_INVOKABLE bool saveConfig() const;

signals:
    void transferLearningChanged();
    void logPathChanged();
    void manualThresholdChanged();
    void runtimeChanged();
    void deviceIndexInputChanged();
    void secondChanged();
    void channelsChanged();
    void samplingRateChanged();
    void importFileChanged();

private:
    bool m_transferLearning;
    QString m_logPath;
    double m_manualThreshold;
    int m_runtime;
    int m_deviceIndexInput;
    int m_second;
    int m_channels;
    int m_samplingRate;
    bool m_importFile;
    // QJsonObject m_fullConfig;

    QString m_filePath;

    void loadDefaults();
    void applyConfig(const QJsonObject& realtime);
    QJsonObject generateConfig() const;
};

#endif // CONFIGURATIONMANAGER_H
