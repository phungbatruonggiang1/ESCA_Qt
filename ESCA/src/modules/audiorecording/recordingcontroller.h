#ifndef RECORDINGCONTROLLER_H
#define RECORDINGCONTROLLER_H

#include <QObject>
#include <QtMultimedia/QAudioDeviceInfo>
#include <QtMultimedia/QAudioInput>


#include "../../config/config.h"
#include "audioconfigfile.h"
#include "inputengine.h"
#include "recordingschedule.h"
#include "recordingio.h"


class AudioEngine;
class RecordingChart;
class RecordingSchedule;
class AudioConfigFile;
class RecordingIO;

class RecordingController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<float> m_bufferChart READ getBufferChart WRITE setbufferChart NOTIFY bufferChartChanged)

    Q_PROPERTY(QVector<QString> recommendSampleRateBuffer READ getRecommendSampleRateBuffer NOTIFY recommendSampleRateBufferChanged)
    Q_PROPERTY(QVector<QString> recommendChannelBuffer READ getRecommendChannelBuffer NOTIFY recommendChannelBufferChanged)
    Q_PROPERTY(QVector<QString> recommendResoultionBuffer READ getRecommendResoultionBuffer NOTIFY recommendResoultionChanged)
    Q_PROPERTY(QVector<QString> recommendCodecBuffer READ getRecommendCodecBuffer NOTIFY recommendCodecChanged)
public:
    explicit RecordingController(QObject *parent = 0);
    ~RecordingController();


    Q_INVOKABLE void startRecording();
    Q_INVOKABLE void stopRecording();
    Q_INVOKABLE void editRecordParameters(QString device, QString path, int sampleRate, int bitsPerSample, int duration);
    Q_INVOKABLE QVector<QString> loadAduioConfigureParameters();
    Q_INVOKABLE void saveAduioConfigureParameters(const QVector<QString> &configValue);


    Q_INVOKABLE QVector<QString> getInputAudioDeviceList();
     Q_INVOKABLE QVector<QString> getOutputAudioDeviceList();
    Q_INVOKABLE void setInputAudioDevice(QString device);
     Q_INVOKABLE void setOutputAudioDevice(QString device);
    // Q_INVOKABLE QVector<QString> loadOutputAudioDeviceList();
    // Q_INVOKABLE void setOutputAudioDevice(QString device);



    QVector<float> getBufferChart() const;
    void setbufferChart(const QVector<float> &newBufferData);


    QVector<QString> getRecommendSampleRateBuffer() const;
    QVector<QString> getRecommendChannelBuffer() const;
    QVector<QString> getRecommendResoultionBuffer() const;
    QVector<QString> getRecommendCodecBuffer() const;








    QString getRecordingStatus() const;
    void setRecordingStatus(const QString &newRecordingStatus);

    int inputAudioInitialize(QString inputDeviceName, QString codec, int channels, int sampleRate, int reslolution);

signals:
    void bufferChartChanged();
    void dataChartSent(const QString &);



    void recommendSampleRateBufferChanged();
    void recommendChannelBufferChanged();
    void recommendResoultionChanged();
    void recommendCodecChanged();


private:
    QAudioFormat formatAudioInput;

    RecordingChart *m_audioChart = nullptr;
    InputEngine *m_audioInputEngine = nullptr;
    RecordingIO *recordingIO = nullptr;
    AudioConfigFile *m_audioConfig = nullptr;
    RecordingSchedule *m_recordingSchedule = nullptr;
    QVector<float> m_bufferChart;


    // audio status
    QString recordingStatus;


    // audio device list
    QVector<QString> m_outputDevice;
    QVector<QString> m_inputDevice;



    QVector<QString> recommendSampleRateBuffer;
    QVector<QString> recommendChannelBuffer;
    QVector<QString> recommendResoultionBuffer;
    QVector<QString> recommendCodecBuffer;



};

#endif // RECORDINGCONTROLLER_H
