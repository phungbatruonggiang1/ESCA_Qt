#include "audiomanipulation.h"

AudioManipulation::AudioManipulation(QObject *parent) : QObject(parent)
{
    // Implement any necessary initialization here
}

void AudioManipulation::extractMFCC(QString audioPath)
{
    qDebug()<<"AudioManipulation audioPath"<<audioPath;
    m_audio_extractor = new Process();

    QString statement = "";
    // statement.append(AUDIO_FEATURES_EXTRACTOR_SRC);
    // statement.append(" \n ");
    statement.append("export PYTHONPATH=~/Desktop/ESCA_Audio_Features_Extractor:$PYTHONPATH && python3 ~/Desktop/ESCA_Audio_Features_Extractor/src/mel.py -f ");
    statement.append(audioPath);
    qInfo() << statement;
    m_audio_extractor->setStatement(statement);
    m_audio_extractor->start();
}

void AudioManipulation::extractGFCC(QString audioPath)
{
    m_audio_extractor = new Process();

    // should be set filePath when click on the audio manipulation and open the file: signal data
    // But now, I'm fixing the filePath to build the prototype version
    QString filePath = "/home/gianghandsome/ESCA/data/";
    // filePath.append(audioPath);
    filePath.append("data.wav");
    // qInfo() << "Hello Giang Dep trai " << filePath;
    // QString statement ="cd /home/sparc/ESCA/gammatone/spafe/src \n python3 mfcc.py -f ";

    QString statement = "cd ";
    statement.append(AUDIO_FEATURES_EXTRACTOR_SRC);
    statement.append(" \n ");
    statement.append("python3 gfcc.py -f ");
    statement.append(filePath);
    qInfo() << statement;
    m_audio_extractor->setStatement(statement);
    m_audio_extractor->start();
}

void AudioManipulation::extractFrequency(QString audioPath)
{
    m_audio_extractor = new Process();

    // should be set filePath when click on the audio manipulation and open the file: signal data
    // But now, I'm fixing the filePath to build the prototype version
    QString filePath = "/home/gianghandsome/ESCA/data/";
    // filePath.append(audioPath);
    filePath.append("data.wav");
    // qInfo() << "Hello Giang Dep trai " << filePath;
    // QString statement ="cd /home/sparc/ESCA/gammatone/spafe/src \n python3 mfcc.py -f ";

    QString statement = "";
    // statement.append(AUDIO_FEATURES_EXTRACTOR_SRC);
    // statement.append(" \n ");
    statement.append("export PYTHONPATH=~/Desktop/ESCA_Audio_Features_Extractor:$PYTHONPATH && python3 ~/Desktop/ESCA_Audio_Features_Extractor/src/frequency.py -f ");
    statement.append(audioPath);
    qInfo() << statement;
    m_audio_extractor->setStatement(statement);
    m_audio_extractor->start();
}

// should not be implement
void AudioManipulation::splitAudio(QString source, QString destination, QString duration)
{
    qDebug()<< "AudioManipulation source: "<<source;
    qDebug()<< "AudioManipulation source: "<<destination;
    QString statement ="cd /home/haiminh/Desktop/D-ESCA_v2 && python3 helper/split_audio_qt.py -s ";
    statement.append(source);
    statement.append(" -d ");
    statement.append(destination);
    statement.append(" -du ");
    statement.append(duration);
    qInfo() << statement;
    m_audio_extractor->setStatement(statement);
    m_audio_extractor->start();
}

