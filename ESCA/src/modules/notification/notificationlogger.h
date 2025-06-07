/* @@@LICENSE
 *
 * Copyright (c) 2020-2025 SPARC Laboratory, HUST.
 * Copyright (c) 2023-2025 Phung Ba Truong Giang.
 *
 * LICENSE@@@ */

#ifndef NOTIFICATIONLOGGER_H
#define NOTIFICATIONLOGGER_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QDir>

class NotificationLogger : public QObject
{
    Q_OBJECT
public:
    explicit NotificationLogger(QObject *parent = nullptr);
    Q_INVOKABLE void logNotification(const QString &message, const QString &type, int priority);

private:
    QFile m_logFile;
};

#endif // NOTIFICATIONLOGGER_H
