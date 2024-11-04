// AIController.cpp
#include "aicontroller.h"
#include <QDebug>

AIController::AIController(QObject *parent)
    : QObject(parent),
    m_dbusManager(new DBusManager(this)),
    m_pythonProcessManager(new PythonProcessManager(this))
{
    // Kết nối các tín hiệu từ DBusManager đến các slot của AIController
    // connect(m_dbusManager, &DBusManager::detectionResult, this, &AIController::onDetectionResult);
    // connect(m_dbusManager, &DBusManager::error, this, &AIController::onProcessError);

    // Kết nối tín hiệu từ PythonProcessManager
    // connect(m_pythonProcessManager, &Process::errorOccured, this, &AIController::onProcessError);
    // connect(m_pythonProcessManager, &Process::finished, this, &AIController::onProcessError); // Ví dụ: Xử lý khi process kết thúc
}

AIController::~AIController()
{
    stopAIProcess();
}

void AIController::startAIProcess()
{
    qInfo() << "Starting AI Process...";
    m_pythonProcessManager->startPythonService();
}

void AIController::stopAIProcess()
{
    qInfo() << "Stopping AI Process...";
    m_pythonProcessManager->stopPythonService();
}

void AIController::initiateDetection(const QString &parameter)
{
    // m_dbusManager->startDetection(parameter);
}

void AIController::onDetectionResult(const QString &result)
{
    qDebug() << "Detection Result:" << result;
    emit detectionResultReceived(result);
}

void AIController::onProcessError(const QString &error)
{
    qDebug() << "Process Error:" << error;
    emit errorOccurred(error);
}
