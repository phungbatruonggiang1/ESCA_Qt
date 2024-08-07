#ifndef ACCESSFILE_H
#define ACCESSFILE_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class AccessFile : public QObject
{
    Q_OBJECT

public:
    explicit AccessFile(QObject *parent = nullptr);

    QString getFilePath();
    void setFilePath(QString newFilePath);

    void writeFile(const QVector<QString> &data);
    QVector<QString> readFile();


private:
       QString filePath;
};

#endif // ACCESSFILE_H
