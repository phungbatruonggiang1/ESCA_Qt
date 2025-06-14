/* @@@LICENSE
 *
 * Copyright (c) 2020-2025 SPARC Laboratory, HUST.
 * Copyright (c) 2023-2025 Phung Ba Truong Giang.
 *
 * LICENSE@@@ */

// ProcessManager.h
#ifndef PROCESSMANAGER_H
#define PROCESSMANAGER_H

#include "../ESCA/src/common/process/process.h"
#include <QDir>


class ProcessManager : public Process
{
    Q_OBJECT

public:
    explicit ProcessManager(QObject *parent = nullptr);
    ~ProcessManager();

    void startPythonService();
    void stopPythonService();

    void setScriptPath(const QString &path);
    QString scriptPath() const;

signals:
    void resultReceived(const float predValue);
    void abnormalDetect();
    void doneProcess();

private slots:
    void handleStandardOutput();
    void handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus);

private:
    QString m_scriptPath;
};

#endif // PROCESSMANAGER_H
