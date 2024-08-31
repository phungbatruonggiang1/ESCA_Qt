#ifndef RECORDINGCONTROLLER_H
#define RECORDINGCONTROLLER_H

#include <QObject>
#include <QAudioDeviceInfo>
#include <QAudioInput>
#include <QList>
#include <QQmlEngine>

#include "../../config/config.h"

#include "audioconfigfile.h"
#include "recordingschedule.h"
#include "audiofilefactory.h"
#include "recordingchart.h"
#include "audioconfig.h"
#include "recordio.h"

class AudioEngine;
class RecordingChart;
class RecordingSchedule;
class AudioConfigFile;
class RecordingChart;
class AudioFileFactory;
class RecordIO;


class RecordingController : public QObject
{

    Q_OBJECT

    Q_PROPERTY(bool recStatus READ recStatus WRITE setRecStatus NOTIFY recStatusChanged FINAL)

public:
    explicit RecordingController(QObject *parent = nullptr);
    ~RecordingController();

    Q_INVOKABLE void startRecording();
    Q_INVOKABLE void stopRecording();   

    bool recStatus() const { return m_recStatus; };
    void setRecStatus(bool newRecStatus);

signals:
    void recStatusChanged();
    void sendChartData(const QByteArray &data);

private slots:
    void handleDataReady(const QByteArray &data);

private:
    RecordIO* m_recordIO = nullptr;
    QAudioFormat formatAudioInput;

    AudioConfigFile* m_audioConfigFile = nullptr;
    RecordingSchedule* m_recordingSchedule = nullptr;

    //save data to storage

    AudioFileFactory* m_fileFactory = nullptr;
    RecordingChart* m_recordingChart;

    AudioConfig* m_audioConfig;
    
    bool m_recStatus;

};

#endif // RECORDINGCONTROLLER_H
