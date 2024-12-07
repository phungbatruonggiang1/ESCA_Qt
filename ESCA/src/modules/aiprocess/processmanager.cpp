#include "processmanager.h"
#include <QDebug>

ProcessManager::ProcessManager(QObject *parent)
    : Process(parent),
    // m_scriptPath("/home/haiminh/Desktop/rt_test.py -cfg /home/haiminh/Desktop/params.yaml -f /home/haiminh/Desktop/temp.csv") // Đường dẫn mặc định
    m_scriptPath("../../../../python_ai/inference/shared_memory_reader.py")
{
    connect(&m_process, &QProcess::readyRead, this, &ProcessManager::handleStandardOutput);
}

ProcessManager::~ProcessManager()
{
    stopPythonService();
}

void ProcessManager::startPythonService()
{
    qInfo() << Q_FUNC_INFO;
    if(m_scriptPath.isEmpty()) {
        qWarning() << "Python script path is not set.";
        return;
    }

    qDebug() << "Current working directory:" << QDir::currentPath();

    setStatement("python3 ~/Desktop/ESCA_Qt/python_ai/inference/shared_memory_reader.py");
    // setStatement("python3 ../../../../python_ai/inference/shared_memory_reader.py");

    qInfo() << statement();

    startProcess();
    start();
}

void ProcessManager::stopPythonService()
{
    qInfo() << Q_FUNC_INFO;
    stop();
}

void ProcessManager::handleStandardOutput()
{
    // if(!m_running) return;
    // qInfo() << Q_FUNC_INFO;

    // QByteArray data = m_process.readAllStandardOutput().trimmed();
    QByteArray data = m_process.readAllStandardOutput().trimmed();
    QString outputStr = QString::fromUtf8(data);
    QString pred = outputStr.split("Pred: ").last();
    float fredValue = pred.left(20).toFloat();

    if (!data.isEmpty() && fredValue != 0.0) {
        qInfo() << "Received from Python:" <<data;
        qInfo() << "Predict Result:" << fredValue;
        emit resultReceived(fredValue);
    }
}

void ProcessManager::handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    qInfo() << "Python process finished with exit code:" << exitCode;
    if (exitStatus == QProcess::CrashExit) {
        qWarning() << "Python process crashed!";
    }
    // Có thể xử lý khi tiến trình kết thúc hoặc có lỗi
}

void ProcessManager::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString ProcessManager::scriptPath() const
{
    return m_scriptPath;
}
