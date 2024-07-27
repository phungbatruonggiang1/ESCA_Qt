#ifndef AUDIOFILEFACTORY_H
#define AUDIOFILEFACTORY_H

#include <QObject>
#include <QString>
#include <QAudioFormat>
#include <qendian.h>
#include <QTimer>
#include <QFile>


#include "../../common/file/accessfile.h"

class AudioFileFactory : public AccessFile
{
    Q_OBJECT
public:
    explicit AudioFileFactory(QObject *parent = nullptr);
    void createFile();
    void saveDataToFile(const QVector<QString> datas);
    void writeWavHeader(QFile &file, qint64 dataSize);


    AudioFormat m_format;
};

#endif // AUDIOFILEFACTORY_H
