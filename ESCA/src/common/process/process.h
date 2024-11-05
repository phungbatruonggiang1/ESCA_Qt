#ifndef PROCESS_H
#define PROCESS_H

#include <QObject>
#include <QProcess>
#include <QString>
#include <QDebug>

class Process : public QObject
{

    Q_OBJECT

public:
    explicit Process(QObject* parent = 0);
    QString operatingSystem();

    QString statement() const;
    void setStatement(const QString &newStatement);

signals:
    void sendLog(QByteArray data);

public slots:
    void start();
    void stop();

private slots:
    void errorOccured(QProcess::ProcessError error);
    void finished(int exitCode, QProcess::ExitStatus exitStatus);
    void readyReadStandardError();
    void readyReadStandardOutput();
    void started();
    void stateChanged(QProcess::ProcessState newState);
    void readyRead();


protected:
    QProcess m_process;
    QString getProcess();
    void startProcess();

private:
    QString m_statement;
    bool m_running;

};

#endif // PROCESS_H
