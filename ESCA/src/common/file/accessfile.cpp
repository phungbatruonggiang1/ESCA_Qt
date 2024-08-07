#include "accessfile.h"
#include "QDebug"

AccessFile::AccessFile(QObject *parent) : QObject(parent)
{
    // Implement any necessary initialization here
}


QString AccessFile::getFilePath()
{
    return filePath;
}

void AccessFile::writeFile(const QVector<QString> &data)
{
    QFile file(filePath);
    if (file.open(QIODevice::WriteOnly))
    {
        QTextStream out(&file);
        for(int i = 0; i < data.size(); i++) {
            out << data[i] << "\n";
            // qInfo() << "Writing lines" << i << data[i];
        }
        file.close();
    }
}

QVector<QString> AccessFile::readFile()
{
    QFile file(filePath);
    QVector<QString> data;
    data.clear();

    if (file.open(QIODevice::ReadOnly))
    {
        QTextStream in(&file);
        in.seek(0);
        QString line;
        int lines = 0;
        while (in.readLineInto(&line))
        {
            // qInfo() << "line read: " << line;
            data += line;
            lines++;
        }
        // qInfo() << "line read: " << line;
        file.close();
    }
    return data;
}

void AccessFile::setFilePath(QString newFilePath)
{
    filePath = newFilePath;
}

