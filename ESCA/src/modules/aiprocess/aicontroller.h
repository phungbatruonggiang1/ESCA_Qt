#ifndef AICONTROLLER_H
#define AICONTROLLER_H

#include <QObject>
#include "processmanager.h"
#include "sharedmemorymanager.h"
#include "configurationmanager.h"

class AIController : public QObject
{
    Q_OBJECT
public:
    explicit AIController(QObject *parent = nullptr);
    ~AIController();

    Q_PROPERTY(bool inferenceStatus READ inferenceStatus WRITE setinferenceStatus NOTIFY inferenceStatusChanged FINAL)
    Q_PROPERTY(QVector<float> predValue READ predValue NOTIFY predValueChanged FINAL)

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();


    QVector<float> predValue() const;

    bool inferenceStatus() const;
    void setinferenceStatus(bool newInferenceStatus);

signals:
    void predValueChanged();
    void inferenceStatusChanged();

private slots:
    void handleInferenceResult(const float predValue);

private:
    // ConfigurationManager* configManager;
    // SharedMemoryManager* sharedMemoryManager;
    ProcessManager* processManager;

    QVector<float> m_predValue;
    bool m_inferenceStatus = false;
};

#endif // AICONTROLLER_H

