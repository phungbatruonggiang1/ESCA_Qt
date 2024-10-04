#ifndef RECORDINGCONTROLLER_H
#define RECORDINGCONTROLLER_H

#include <QObject>
#include <QAudioDeviceInfo>
#include <QAudioInput>
#include <QList>
#include <QQmlEngine>
#include <QThread>
#include <QMutex>

#include "../../config/config.h"

#include "recordingschedule.h"
#include "recordingchart.h"
#include "audioconfig.h"
#include "audiofile.h"
#include "recordio.h"

class RecordingController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool recStatus READ recStatus WRITE setRecStatus NOTIFY recStatusChanged FINAL)

public:
    explicit RecordingController(QObject *parent = nullptr);
    ~RecordingController();

    Q_INVOKABLE void startRecording();
    Q_INVOKABLE void stopRecording();

    bool recStatus();
    void setRecStatus(bool newRecStatus);

signals:
    void recStatusChanged();
    void sendChartData(const QByteArray &data);

private slots:
    void handleDataReady(const QByteArray &data);

private:
    RecordingSchedule* m_recordingSchedule;
    RecordIO* m_recordIO;
    RecordingChart* m_recordingChart;
    AudioConfig* m_audioConfig;
    AudioFile* m_audioFile;

    QThread *m_audioFileThread;

    QAudioFormat format;

    QMutex m_mutex;

    QString m_outputDir;
    
    bool m_recStatus;
};

#endif // RECORDINGCONTROLLER_H
