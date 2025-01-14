// TransferProcMng.h
#ifndef TRANSFERPROCMNG_H
#define TRANSFERPROCMNG_H

#include "../ESCA/src/common/process/process.h"
#include <QDir>
#include <QRegularExpression>


class TransferProcMng : public Process
{
    Q_OBJECT

public:
    explicit TransferProcMng(QObject *parent = nullptr);
    ~TransferProcMng();

    void startPythonService();
    void stopPythonService();

    void setScriptPath(const QString &path);
    QString scriptPath() const;

signals:
    // void resultReceived(const float predValue);
    // void logUpdated(QString, int, int, QVariantMap);
    void logUpdated(int, int, QString, QVariantMap);


private slots:
    void handleStandardOutput();
    void handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);

private:
    QString m_scriptPath;
    int m_epoch = 0;
    int m_totalEpoch = 0;
    QVariantMap m_details;

};

#endif // TransferProcMng_H
