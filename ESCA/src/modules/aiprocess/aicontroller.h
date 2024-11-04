// AIController.h
#ifndef AICONTROLLER_H
#define AICONTROLLER_H

#include <QObject>
#include <QProcess>
#include "../ESCA/src/common/process/process.h"
#include "dbusmanager.h"
#include "pythonprocessmanager.h"

class AIController : public QObject
{
    Q_OBJECT

public:
    explicit AIController(QObject *parent = nullptr);
    ~AIController();

    void startAIProcess();
    void stopAIProcess();
    void initiateDetection(const QString &parameter);

signals:
    void detectionResultReceived(const QString &result);
    void errorOccurred(const QString &error);

private slots:
    void onDetectionResult(const QString &result);
    void onProcessError(const QString &error);

private:
    DBusManager *m_dbusManager;
    PythonProcessManager *m_pythonProcessManager;
};

#endif // AICONTROLLER_H
