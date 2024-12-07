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
}

void AIController::stop()
{
    processManager->stopPythonService();
}

void AIController::handleInferenceResult(const float predValue)
{
    if (predValue) {
        m_predValue.push_back(predValue);

        if (m_predValue.size() > 50) { // Giới hạn số cột hiển thị
            m_predValue.removeFirst();
        }
        emit predValueChanged();
        // qDebug() << "Data arr: "<<m_predValue;
    } else {
        // qDebug() << "Data loi ne cau =0, hoac toan chu b";
    }
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

QVector<float> AIController::predValue() const
{
    return m_predValue;
}

