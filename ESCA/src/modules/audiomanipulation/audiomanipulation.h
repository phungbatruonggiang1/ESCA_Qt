#ifndef AUDIOMANIPULATION_H
#define AUDIOMANIPULATION_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QTextStream>
#include <QDebug>

#include "../../config/config.h"
#include "../../common/process/process.h"

class Process;

class AudioManipulation : public QObject
{
    Q_OBJECT

public:
    explicit AudioManipulation(QObject *parent = nullptr);

    Q_INVOKABLE void extractMFCC(QString audioPath);
    Q_INVOKABLE void extractGFCC(QString audioPath);
    Q_INVOKABLE void extractFrequency(QString audioPath);
    Q_INVOKABLE void splitAudio(QString source, QString destination, QString duration);

private:
    Process* m_audio_extractor = nullptr;
    
};

#endif // AUDIOMANIPULATION_H
