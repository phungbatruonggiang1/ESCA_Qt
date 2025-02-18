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
    setStatement("python3 ~/Desktop/ESCA_Qt/python_ai/inference.py");
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
    QByteArray data = m_process.readAllStandardOutput();
    if (data.isEmpty()) return; // Tránh xử lý khi không có dữ liệu

    QString outputStr = QString::fromUtf8(data);

    bool ok;
    float predValue = outputStr.toFloat(&ok); // Lấy trực tiếp giá trị số từ stdout

    if (ok && predValue != 0.0f) {
        qInfo() << "Predict Result:" << predValue;
        emit resultReceived(predValue);
    } else {
        qWarning() << "Invalid data from Python:" << outputStr;
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
