#ifndef AUDIOCONFIGFILE_H
#define AUDIOCONFIGFILE_H

#include <QObject>
#include <QString>

#include "../../common/file/accessfile.h"


class AudioConfigFile : public AccessFile
{
    Q_OBJECT
public:
    explicit AudioConfigFile(QObject *parent = nullptr);

    void saveAudioConfigureParameters(const QVector<QString> configValue);
    QVector<QString> loadAudioConfigureParameters();
    int checkAudioSetuped(QVector<QString> &configValue);


signals:
    void saveAudioConfigureParamtersSignal(const QString &configValue);
};

#endif // AUDIOCONFIGFILE_H
