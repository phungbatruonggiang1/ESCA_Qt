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

    Q_PROPERTY(bool isRunning READ isRunning WRITE setIsRunning NOTIFY isRunningChanged FINAL)
    Q_PROPERTY(QVector<float> predValue READ predValue NOTIFY predValueChanged FINAL)

    Q_INVOKABLE void start();
    Q_INVOKABLE void stop();

    bool isRunning() const;
    void setIsRunning(bool newIsRunning);

    QVector<float> predValue() const;

signals:
    void isRunningChanged();
    void predValueChanged();

private slots:
    void handleInferenceResult(const float predValue);

private:
    // ConfigurationManager* configManager;
    // SharedMemoryManager* sharedMemoryManager;
    ProcessManager* processManager;

    bool m_isRunning = false;
    QVector<float> m_predValue;
};

#endif // AICONTROLLER_H

