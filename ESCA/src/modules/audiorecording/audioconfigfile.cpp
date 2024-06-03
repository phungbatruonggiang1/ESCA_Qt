#include "audioconfigfile.h"

AudioConfigFile::AudioConfigFile(QObject *parent)
{

}

void AudioConfigFile::saveAudioConfigureParameters(const QVector<QString> &configValue)
{
    // setFilePath(RECORDING_CONFIG_FILE);
    setFilePath("../database/recording_params.txt");
    // writeFile(configValue);
}

QVector<QString> AudioConfigFile::loadAudioConfigureParameters()
{
    QVector<QString> result = readFile();
    return result;
}

