#ifndef RECORDINGCONTROLLER_H
#define RECORDINGCONTROLLER_H

#include <QObject>
#include <QString>

#include "audioconfigfile.h"
#include "audioengine.h"
#include "recordingchart.h"
#include "recordingschedule.h"


class AudioEngine;
class RecordingChart;
class RecordingSchedule;
class AudioConfigFile;

class RecordingController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<float> m_bufferChart READ getBufferChart WRITE setbufferChart NOTIFY bufferChartChanged)
public:
    explicit AudioController(QObject *parent = 0);
    ~AudioController();


    Q_INVOKABLE void startRecording();
    Q_INVOKABLE void stopRecording();
    Q_INVOKABLE void editRecordParameters(QString device, QString path, int sampleRate, int bitsPerSample, int duration);
    Q_INVOKABLE QVector<QString> loadAduioConfigureParameters();
    Q_INVOKABLE void saveAduioConfigureParameters(const QVector<QString> &configValue);


    Q_INVOKABLE QVector<QString> getInputAudioDeviceList();
    Q_INVOKABLE void setInputAudioDevice(QString device);
    Q_INVOKABLE QVector<QString> loadOutputAudioDeviceList();
    Q_INVOKABLE void setOutputAudioDevice(QString device);



    QVector<float> getBufferChart() const;
    void setbufferChart(const QVector<float> &newBufferData);



signals:
    void bufferChartChanged();
    void dataChartSent(const QString &);


private:
    RecordingChart *m_audioChart = nullptr;
    AudioEngine *m_audioEngine = nullptr;
    AudioConfigFile *m_audioConfig = nullptr;
    RecordingSchedule *m_recordingSchedule = nullptr;
    QVector<float> m_bufferChart;
};

#endif // RECORDINGCONTROLLER_H
