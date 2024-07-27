#include "process.h"

Process::Process(QObject* parent) : QObject(parent){
    connect(&m_process, &QProcess::errorOccurred, this, &Process::errorOccured);
    connect(&m_process, &QProcess::readyReadStandardError, this, &Process::readyReadStandardError);
    connect(&m_process, &QProcess::readyReadStandardOutput, this, &Process::readyReadStandardOutput);
    connect(&m_process, &QProcess::started, this, &Process::started);
    connect(&m_process, &QProcess::stateChanged, this, &Process::stateChanged);
    connect(&m_process, &QProcess::readyRead, this, &Process::readyRead);

    m_running = false;

    // finished is overloaded
    connect(&m_process, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished), this, &Process::finished);
}

QString Process::operatingSystem()
{
    return QSysInfo::prettyProductName();
}

void Process::start()
{
    qInfo() << Q_FUNC_INFO;
    m_running = true;
    m_process.start(getProcess());

}

void Process::stop()
{
    qInfo() << Q_FUNC_INFO;
    m_running = false;
    m_process.close();
}

void Process::errorOccured(QProcess::ProcessError error)
{
    if(!m_running) return;
    qInfo() << Q_FUNC_INFO << error;
    qInfo() << "Error";
    // emit output("Error");
}

void Process::finished(int exitCode, QProcess::ExitStatus exitStatus)
{
    if(!m_running) return;
    qInfo() << Q_FUNC_INFO;
    Q_UNUSED(exitCode);
    Q_UNUSED(exitStatus);
    qInfo() << "Complete";
    // emit output("Complete");
}

void Process::readyReadStandardError()
{
    if(!m_running) return;
    qInfo() << Q_FUNC_INFO;
    QByteArray data = m_process.readAllStandardError();
    QString message = "Standard Error: ";
    message.append(m_process.readAllStandardError());
    qInfo() << message;
    // emit output(message);
}

void Process::readyReadStandardOutput()
{
    if(!m_running) return;
    qInfo() << Q_FUNC_INFO;
    QByteArray data = m_process.readAllStandardOutput();
    qInfo() << QString(data.trimmed());
    // emit output(QString(data.trimmed()));
}

void Process::started()
{
    // do nothing
    qInfo() << Q_FUNC_INFO;
}

void Process::stateChanged(QProcess::ProcessState newState)
{
    qInfo() << Q_FUNC_INFO;
    switch(newState) {
    case QProcess::NotRunning:
        qInfo() << "Not Running";
        // emit output("Not Running");
        break;
    case QProcess::Starting:
        qInfo() << "Starting";
        // emit output("Starting");
        break;
    case QProcess::Running:
        qInfo() << "Running";
        startProcess();
        // emit output("Running");
        break;
    }
}

void Process::readyRead()
{
    if(!m_running) return;
    qInfo() << Q_FUNC_INFO;
    QByteArray data = m_process.readAll().trimmed();
    qInfo() << data;
    // emit output(data);

}

QString Process::statement() const
{
    return m_statement;
}

void Process::setStatement(const QString &newStatement)
{
    m_statement = newStatement;
}

QString Process::getProcess()
{
    qInfo() << Q_FUNC_INFO;
    if(QSysInfo::productType() == "windows") return "cmd";
    if(QSysInfo::productType() == "osx") return "/bin/zsh";
    return "bash";
}

void Process::startProcess()
{
    QByteArray command;
    command.append(m_statement);
    if(QSysInfo::productType() == "windows") command.append("\r");
    command.append("\n");
    m_process.write(command);
}


