#ifndef AUDIOCONFIGFILE_H
#define AUDIOCONFIGFILE_H

#include <QObject>
#include <QString>

#include "../../common/file/accessfile.h"
#include "../../config/config.h"


class AudioConfigFile : public AccessFile
{
    Q_OBJECT
public:
    explicit AudioConfigFile(QObject *parent = nullptr);

public slots:
    Q_INVOKABLE void saveAudioConfigureParameters(const QVector<QString> &configValue);
    Q_INVOKABLE QVector<QString> loadAudioConfigureParameters();


signals:
    void saveAudioConfigureParamtersSignal(const QString &configValue);
};

#endif // AUDIOCONFIGFILE_H
