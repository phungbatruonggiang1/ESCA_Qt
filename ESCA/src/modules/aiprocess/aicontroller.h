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

    Q_PROPERTY(bool isRunning READ isRunning WRITE setIsRunning NOTIFY isRunningChanged FINAL)
    Q_PROPERTY(QString inferenceResult READ inferenceResult WRITE setInferenceResult NOTIFY inferenceResultChanged FINAL)
    Q_PROPERTY(QString errMessage READ errMessage WRITE setErrMessage NOTIFY errMessageChanged FINAL)

public:
    explicit AIController(QObject *parent = nullptr);
    ~AIController();

    Q_INVOKABLE void startAIProcess();
    Q_INVOKABLE void stopAIProcess();
    Q_INVOKABLE void initiateDetection(const QString &parameter);

    bool isRunning() const;
    void setIsRunning(bool newIsRunning);

    QString inferenceResult() const;
    void setInferenceResult(const QString &newInferenceResult);

    QString errMessage() const;
    void setErrMessage(const QString &newErrMessage);

signals:
    void detectionResultReceived(const QString &result);
    void errorOccurred(const QString &error);

    void isRunningChanged();

    void inferenceResultChanged();

    void errMessageChanged();

private slots:
    void onDetectionResult(const QByteArray &result);
    void onProcessError(const QString &error);

private:
    DBusManager *m_dbusManager;
    PythonProcessManager *m_pythonProcessManager;
    bool m_isRunning = false;
    QString m_inferenceResult;
    QString m_errMessage;
};

#endif // AICONTROLLER_H
