// pythonprocessmanager.h
#ifndef PYTHONPROCESSMANAGER_H
#define PYTHONPROCESSMANAGER_H

#include "../ESCA/src/common/process/process.h"

class PythonProcessManager : public Process
{
    Q_OBJECT

public:
    explicit PythonProcessManager(QObject *parent = nullptr);
    ~PythonProcessManager();

    void startPythonService();
    void stopPythonService();

    void setScriptPath(const QString &path);
    QString scriptPath() const;

private:
    QString m_scriptPath;
};

#endif // PYTHONPROCESSMANAGER_H
