#ifndef AUDIOMANIPULATION_H
#define AUDIOMANIPULATION_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QTextStream>
#include <QDebug>


class AudioManipulation : public QObject
{
    Q_OBJECT

public:
    explicit AudioManipulation(QObject *parent = nullptr);

    virtual void setFilePath() = 0;
    QString getFilePath();

    virtual void writeFile(const QString filePath, const QVector<QString> &configValue)=0;
    virtual QVector<QString> readFile(const QString &filePath)=0;

    QString filePath;

    //private:
    //    QString filePath;
};

#endif // AUDIOMANIPULATION_H
