// AIController.cpp
#include "aicontroller.h"
#include <QDebug>

AIController::AIController(QObject *parent)
    : QObject(parent),
    m_dbusManager(new DBusManager(this)),
    m_pythonProcessManager(new PythonProcessManager(this))
{
/*    // Kết nối các tín hiệu từ DBusManager đến các slot của AIController
    connect(m_dbusManager, &DBusManager::detectionResult, this, &AIController::onDetectionResult);
    connect(m_dbusManager, &DBusManager::error, this, &AIController::onProcessError);

    // Kết nối tín hiệu từ PythonProcessManager
    connect(m_pythonProcessManager, &PythonProcessManager::processError, this, &AIController::onProcessError);
    connect(m_pythonProcessManager, &PythonProcessManager::processOutput, this, &AIController::onProcessError); */// Tùy chỉnh nếu cần

    connect(m_pythonProcessManager, &PythonProcessManager::resultReceived, this, &AIController::onDetectionResult);

}

AIController::~AIController()
{
    stopAIProcess();
}

void AIController::startAIProcess()
{
    qInfo() << "Starting AI Process...";   
    m_pythonProcessManager->startPythonService();

    setIsRunning(true);

}

void AIController::stopAIProcess()
{
    qInfo() << "Stopping AI Process...";
    m_pythonProcessManager->stopPythonService();

    setIsRunning(false);
}

void AIController::initiateDetection(const QString &parameter)
{
    // m_dbusManager->startDetection(parameter);
}

void AIController::onDetectionResult(const QByteArray &result)
{
    qDebug() << "Detection Result:" << result;
    setInferenceResult(result+"");
}

void AIController::onProcessError(const QString &error)
{
    qDebug() << "Process Error:" << error;
    emit errorOccurred(error);
}

bool AIController::isRunning() const
{
    return m_isRunning;
}

void AIController::setIsRunning(bool newIsRunning)
{
    if (m_isRunning == newIsRunning)
        return;
    m_isRunning = newIsRunning;
    emit isRunningChanged();
}

QString AIController::inferenceResult() const
{
    return m_inferenceResult;
}

void AIController::setInferenceResult(const QString &newInferenceResult)
{
    if (m_inferenceResult == newInferenceResult)
        return;
    m_inferenceResult = newInferenceResult;
    emit inferenceResultChanged();
}

QString AIController::errMessage() const
{
    return m_errMessage;
}

void AIController::setErrMessage(const QString &newErrMessage)
{
    if (m_errMessage == newErrMessage)
        return;
    m_errMessage = newErrMessage;
    emit errMessageChanged();
}
