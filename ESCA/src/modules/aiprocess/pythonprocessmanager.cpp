// pythonprocessmanager.cpp
#include "pythonprocessmanager.h"
#include <QDebug>

PythonProcessManager::PythonProcessManager(QObject *parent)
    : Process(parent),
    m_scriptPath("/usr/bin/ai_detector_service.py") // Đường dẫn mặc định, bạn có thể thay đổi
{

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
    QString pythonExecutable = "/usr/bin/python3"; // Đường dẫn tới Python trên Jetson Nano
    QString command = QString("%1 %2").arg(pythonExecutable).arg(m_scriptPath);
    setStatement(command);

    // Khởi động process
    start();
}

void PythonProcessManager::stopPythonService()
{
    qInfo() << Q_FUNC_INFO;
    stop();
}

void PythonProcessManager::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString PythonProcessManager::scriptPath() const
{
    return m_scriptPath;
}
