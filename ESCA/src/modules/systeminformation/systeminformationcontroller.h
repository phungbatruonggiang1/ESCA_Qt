#ifndef SYSTEMINFORMATIONCONTROLLER_H
#define SYSTEMINFORMATIONCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
#include <QTimer>
#include <QFile>
#include <QStorageInfo>


class SystemInformationController : public QObject
{

    Q_OBJECT
    
    Q_PROPERTY(int cpuPercentage READ cpuPercentage NOTIFY cpuChanged)
    Q_PROPERTY(QString cpuText READ cpuText NOTIFY cpuChanged)
    Q_PROPERTY(int ramPercentage READ ramPercentage NOTIFY ramChanged)
    Q_PROPERTY(QString ramText READ ramText NOTIFY ramChanged)
    Q_PROPERTY(int gpuPercentage READ gpuPercentage NOTIFY gpuChanged)
    Q_PROPERTY(QString gpuText READ gpuText NOTIFY gpuChanged)
    Q_PROPERTY(QString diskText READ diskText NOTIFY diskChanged)
    Q_PROPERTY(QString networkPingText READ networkPingText NOTIFY networkPingChanged)

public:
    explicit SystemInformationController(QObject *parent = nullptr);
    ~SystemInformationController();

    int cpuPercentage() const;
    QString cpuText() const;

    int gpuPercentage() const;
    QString gpuText() const;

    int ramPercentage() const;
    QString ramText() const;

    QString diskText() const;
    QString networkPingText() const;

signals:
    void cpuChanged();
    void gpuChanged();
    void ramChanged();
    void diskChanged();
    void networkPingChanged();

public slots:
    void updateNetworkPing();
    QString getCpuName();
    QString getGpuName();
    int getCacheL1();
    QString getCacheL2();

private:
    QTimer m_timer;
    unsigned long long lastTotalUser, lastTotalUserLow, lastTotalSys, lastTotalIdle;
    unsigned int total = 0;
    int m_cpu = 0;
    double getCpu();
    
    int parseLine(char* line);
    int m_ram = 0;
    double getRam();

    int m_gpu = 0;
    double getGpu();

    int m_disk = 0;
    double getDisk();

    double m_ping = 0;
    QString getGateway();
    double getNetworkPing();
};
#endif // SYSTEMINFORMATIONCONTROLLER_H
