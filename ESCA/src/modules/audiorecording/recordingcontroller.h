#ifndef RECORDINGCONTROLLER_H
#define RECORDINGCONTROLLER_H

#include <QObject>
#include <QAudioDeviceInfo>
#include <QAudioInput>
#include <QList>
#include <QQmlEngine>

#include "../../config/config.h"

#include "audioconfigfile.h"
#include "recordio.h"
#include "recordingschedule.h"
#include "recorddevice.h"
#include "audiofilefactory.h"
#include "recordingchart.h"
#include "audioconfig.h"
#include "audiofile.h"

class AudioEngine;
class RecordingChart;
class RecordingSchedule;
class AudioConfigFile;
class RecordDevice;
class RecordingChart;
class AudioFileFactory;

class RecordingController : public QObject
{

    Q_OBJECT
    Q_PROPERTY(bool recStatus READ recStatus WRITE setRecStatus NOTIFY recStatusChanged FINAL)

public:
    explicit RecordingController(QObject *parent = nullptr);
    ~RecordingController();

    Q_INVOKABLE void startRecording();
    Q_INVOKABLE void stopRecording();   

    bool recStatus() const;
    void setRecStatus(bool newRecStatus);

signals:
    void recStatusChanged();
    void sendChartData(const QByteArray &data);

private slots:
    void handleDataReady(const QByteArray &data);

private:
    RecordDevice* m_recordDevice;
    QAudioFormat formatAudioInput;

    RecordIO* m_recordIO = nullptr;
    AudioConfigFile* m_audioConfigFile = nullptr;
    RecordingSchedule* m_recordingSchedule = nullptr;

    //save data to storage

    AudioFileFactory* m_fileFactory;
    RecordingChart* m_recordingChart;

    AudioConfig* m_audioConfig;
    AudioFile m_audioFile;
    
    bool m_recStatus;

};

#endif // RECORDINGCONTROLLER_H
