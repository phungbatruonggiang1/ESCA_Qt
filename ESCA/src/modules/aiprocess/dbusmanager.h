#ifndef DBUSMANAGER_H
#define DBUSMANAGER_H

#include <QObject>

class DBusManager : public QObject
{
    Q_OBJECT
public:
    explicit DBusManager(QObject *parent = nullptr);

signals:

};

#endif // DBUSMANAGER_H
