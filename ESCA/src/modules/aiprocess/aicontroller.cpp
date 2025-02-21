#include "aicontroller.h"
#include <QDebug>

AIController::AIController(QObject *parent) : QObject(parent)
{
    // configManager = new ConfigurationManager(this);
    // sharedMemoryManager = new SharedMemoryManager(this);
    processManager = new ProcessManager(this);
    // Kết nối tín hiệu từ ProcessManager tới AIController
    connect(processManager, &ProcessManager::resultReceived, this, &AIController::handleInferenceResult);
    connect(processManager, &ProcessManager::abnormalDetect, this, &AIController::handleAbnormalDetect);
}

AIController::~AIController()
{
    stop();
}

void AIController::start()
{
    // Đọc cấu hình
    // if (!configManager->loadConfig("python_ai/ai_module/config/config.json")) {
    //     qWarning() << "Failed to load configuration.";
    //     return;
    // }
    processManager->startPythonService();
    setinferenceStatus(true);
}

void AIController::stop()
{
    processManager->stopPythonService();
    setinferenceStatus(false);
}

void AIController::handleInferenceResult(const float predValue)
{
    m_predValue.push_back(predValue);

    if (m_predValue.size() > 200) { // Giới hạn số cột hiển thị
        m_predValue.removeFirst();
    }
    emit predValueChanged();
    // qDebug() << "Data arr: "<<m_predValue;
}

void AIController::handleAbnormalDetect()
{
    setAbnomalDetect(true);
    qDebug() << "setAbnomalDetect: "<<abnomalDetect();
}

QVector<float> AIController::predValue() const
{
    return m_predValue;
}

bool AIController::inferenceStatus() const
{
    return m_inferenceStatus;
}

void AIController::setinferenceStatus(bool newInferenceStatus)
{
    if (m_inferenceStatus == newInferenceStatus)
        return;
    m_inferenceStatus = newInferenceStatus;
    emit inferenceStatusChanged();
}

bool AIController::abnomalDetect() const
{
    return m_abnomalDetect;
}

void AIController::setAbnomalDetect(bool newAbnomalDetect)
{
    m_abnomalDetect = newAbnomalDetect;
    emit abnomalDetectChanged();
}
