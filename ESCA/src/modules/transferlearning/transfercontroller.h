#ifndef TRANSFERCONTROLLER_H
#define TRANSFERCONTROLLER_H

#include <QObject>
#include <QString>
#include <QQmlEngine>

#include "transferprocmng.h"
#include "histogrammanager.h"
#include "prmanager.h"
#include "rocmanager.h"

class TransferController : public QObject
{
    Q_OBJECT
public:
    explicit TransferController(QObject *parent = nullptr);
    ~TransferController();

    Q_PROPERTY(bool tlStatus READ tlStatus WRITE setTlStatus NOTIFY tlStatusChanged FINAL)

    Q_PROPERTY(QString rawLog READ rawLog NOTIFY rawLogChanged)
    Q_PROPERTY(int epoch READ epoch NOTIFY epochChanged)
    Q_PROPERTY(int totalEpoch READ totalEpoch NOTIFY totalEpochChanged)
    Q_PROPERTY(QString details READ details NOTIFY detailsChanged)
    Q_PROPERTY(QString stepType READ stepType NOTIFY stepTypeChanged)

    Q_PROPERTY(QVariantList logList READ logList NOTIFY logListChanged)    

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

    QString rawLog() const;

    int epoch() const;

    int totalEpoch() const;

    QString details() const;

    QVariantList logList() const;

    QString stepType() const;

    bool tlStatus() const;
    void setTlStatus(bool newTlStatus);

signals:
    void rawLogChanged();

    void epochChanged();

    void totalEpochChanged();

    void detailsChanged();

    void logListChanged();

    void stepTypeChanged();

    void tlStatusChanged();

public slots:
    // void handleLogUpdated(const QString &log, int epoch, int totalEpoch, const QVariantMap &details);
    void handleLogUpdated(int epoch, int totalEpoch, const QString &stepType, const QVariantMap &details);

private:
    TransferProcMng* transferProcMng;
    HistogramManager* m_histogram;
    PRManager* m_prManager;
    ROCManager* m_rocManager;

    QString m_rawLog;
    int m_epoch;
    int m_totalEpoch;
    QString m_details;
    QVariantList m_logList;
    QString m_stepType;

    bool m_tlStatus = false;
};

#endif // TransferController_H

