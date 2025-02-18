#include "aicontroller.h"
#include <QDebug>

AIController::AIController(QObject *parent) : QObject(parent)
{
    // configManager = new ConfigurationManager(this);
    // sharedMemoryManager = new SharedMemoryManager(this);
    processManager = new ProcessManager(this);
    // Kết nối tín hiệu từ ProcessManager tới AIController
    connect(processManager, &ProcessManager::resultReceived, this, &AIController::handleInferenceResult);
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
    if (predValue != 0.0f) {
        m_predValue.push_back(predValue);

        if (m_predValue.size() > 200) { // Giới hạn số cột hiển thị
            m_predValue.removeFirst();
        }
        emit predValueChanged();
        // qDebug() << "Data arr: "<<m_predValue;
    } else {
        // qDebug() << "Data loi ne cau =0, hoac toan chu b";
    }
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
