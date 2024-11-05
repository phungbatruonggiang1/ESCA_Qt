// pythonprocessmanager.cpp
#include "pythonprocessmanager.h"
#include <QDebug>

PythonProcessManager::PythonProcessManager(QObject *parent)
    : Process(parent),
    m_scriptPath("/home/haiminh/Desktop/minh.py") // Đường dẫn mặc định
{
    connect(&m_process, &QProcess::readyRead, this, &PythonProcessManager::handleStandardOutput);
}

PythonProcessManager::~PythonProcessManager()
{
    stopPythonService();
}

void PythonProcessManager::startPythonService()
{
    qInfo() << Q_FUNC_INFO;
    if(m_scriptPath.isEmpty()) {
        qWarning() << "Python script path is not set.";
        return;
    }

    // Thiết lập lệnh khởi chạy Python script
    QString pythonExecutable = "python3";
    QString command = QString("%1 %2").arg(pythonExecutable).arg(m_scriptPath);
    setStatement(command);

    qInfo() << statement();

    // Khởi động process
    start();
}

void PythonProcessManager::stopPythonService()
{
    qInfo() << Q_FUNC_INFO;
    stop();
}

void PythonProcessManager::handleStandardOutput()
{
    // if(!m_running) return;
    qInfo() << Q_FUNC_INFO;
    QByteArray data = m_process.readAll().trimmed();
    qInfo() << data;

    emit resultReceived(data);
}

void PythonProcessManager::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString PythonProcessManager::scriptPath() const
{
    return m_scriptPath;
}
