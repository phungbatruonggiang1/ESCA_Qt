#ifndef AUDIOFILEFACTORY_H
#define AUDIOFILEFACTORY_H

#include <QObject>
#include <QString>
#include <QAudioFormat>
#include <QDataStream>
#include <qendian.h>
#include <QTimer>
#include <QFile>


#include "../../common/file/accessfile.h"

class AudioFileFactory : public AccessFile
{
    Q_OBJECT
public:
    explicit AudioFileFactory(const QAudioFormat &format);
    void createFile();
    void saveDataToFile(const QVector<QString> datas);
    void writeWavHeader(QFile &file, qint64 dataSize);


    const QAudioFormat m_format;
};

#endif // AUDIOFILEFACTORY_H
