#include "audioconfigfile.h"
#include "QDebug"

AudioConfigFile::AudioConfigFile(QObject *parent)
{

}

int AudioConfigFile::checkAudioSetuped(QVector<QString> &configValue)
{
    QVector<QString> result = readFile();
    configValue = result;
    QString inputDevice = configValue[0];
    if(inputDevice != NULL && inputDevice != "none")
        return 1;
    return 0;

}

void AudioConfigFile::saveAudioConfigureParameters(const QVector<QString> configValue)
{
    writeFile(configValue);
}

QVector<QString> AudioConfigFile::loadAudioConfigureParameters()
{
    QVector<QString> result = readFile();
    return result;
}

