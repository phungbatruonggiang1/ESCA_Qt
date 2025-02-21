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
    Q_PROPERTY(bool abnomalDetect READ abnomalDetect WRITE setAbnomalDetect NOTIFY abnomalDetectChanged FINAL)

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

    QVector<float> predValue() const;

    bool inferenceStatus() const;
    void setinferenceStatus(bool newInferenceStatus);

    bool abnomalDetect() const;
    void setAbnomalDetect(bool newAbnomalDetect);

signals:
    void predValueChanged();
    void inferenceStatusChanged();
    void abnomalDetectChanged();

private slots:
    void handleInferenceResult(const float predValue);
    void handleAbnormalDetect();

private:
    // ConfigurationManager* configManager;
    // SharedMemoryManager* sharedMemoryManager;
    ProcessManager* processManager;

    QVector<float> m_predValue;
    bool m_inferenceStatus = false;
    bool m_abnomalDetect = false;
};

#endif // AICONTROLLER_H

