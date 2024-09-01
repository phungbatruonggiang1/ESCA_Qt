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
    void saveDataToFile();
    void writeWavHeader(QFile &file, qint64 dataSize);

    const QAudioFormat m_format;

    void startTimer();
    void stopTimer();
    void setFileDuration(int duration);
    int getFileDuration() const { return m_fileDuration; };
    void setDirectoryToSaveAduioFile(QString path);
    QString getDirectorySaveAudioFile() const { return m_directory; };
    void appendDataToBuffer(const QByteArray &data);


private:
    QTimer* m_timer;
    int m_fileDuration;
    QString m_directory;
    QByteArray m_dataBuffer;

};

#endif // AUDIOFILEFACTORY_H
