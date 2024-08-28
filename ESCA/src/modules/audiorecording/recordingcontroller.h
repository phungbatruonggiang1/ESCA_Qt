#ifndef RECORDINGCONTROLLER_H
#define RECORDINGCONTROLLER_H

#include <QObject>
#include <QtMultimedia/QAudioDeviceInfo>
#include <QtMultimedia/QAudioInput>
#include <QList>

#include "../../config/config.h"

#include "audioconfigfile.h"
#include "inputengine.h"
#include "recordingschedule.h"
#include "recordingio.h"
#include "audiofilefactory.h"
#include "recordingchart.h"

class AudioEngine;
class RecordingChart;
class RecordingSchedule;
class AudioConfigFile;
class RecordingIO;
class RecordingChart;
class AudioFileFactory;

class RecordingController : public QObject
{

    Q_OBJECT

    Q_PROPERTY(QVector<QString> recommendSampleRateBuffer READ getRecommendSampleRateBuffer NOTIFY recommendSampleRateBufferChanged)
    Q_PROPERTY(QVector<QString> recommendChannelBuffer READ getRecommendChannelBuffer NOTIFY recommendChannelBufferChanged)
    Q_PROPERTY(QVector<QString> recommendResoultionBuffer READ getRecommendResoultionBuffer NOTIFY recommendResoultionChanged)
    Q_PROPERTY(QVector<QString> recommendCodecBuffer READ getRecommendCodecBuffer NOTIFY recommendCodecChanged)
    Q_PROPERTY(QVector<quint32> m_recordingChartBuffer READ recordingChartBuffer NOTIFY recordingChartBufferChanged)

    Q_PROPERTY(bool recStatus READ recStatus WRITE setRecStatus NOTIFY recStatusChanged FINAL)

public:
    explicit RecordingController(QObject *parent = nullptr);
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


    QVector<QString> getRecommendSampleRateBuffer() const { return recommendSampleRateBuffer; }
    QVector<QString> getRecommendChannelBuffer() const { return recommendChannelBuffer;}
    QVector<QString> getRecommendResoultionBuffer() const { return recommendResoultionBuffer;}
    QVector<QString> getRecommendCodecBuffer() const { return recommendCodecBuffer;}


    QString getRecordingStatus() const;
    void setRecordingStatus(const QString &newRecordingStatus);

    int inputAudioInitialize(QString inputDeviceName, QString codec, int channels, int sampleRate, int reslolution);

    QVector<quint32> recordingChartBuffer() const { return m_recordingChartBuffer; }



    bool recStatus() const;
    void setRecStatus(bool newRecStatus);

signals:
    void recommendSampleRateBufferChanged();
    void recommendChannelBufferChanged();
    void recommendResoultionChanged();
    void recommendCodecChanged();

    void recordingChartBufferChanged();

    void recStatusChanged();

private slots:
    void handleDataReady(const QVector<quint32> &buffer);
    void setRecoringChartBuffer();

private:
    RecordingIO* recordingIO;
    QAudioFormat formatAudioInput;

    InputEngine* m_audioInputEngine = nullptr;
    AudioConfigFile* m_audioConfig = nullptr;
    RecordingSchedule* m_recordingSchedule = nullptr;


    // audio status
    QString recordingStatus;

    // audio device list
    QVector<QString> m_outputDevice;
    QVector<QString> m_inputDevice;
    QVector<QString> recommendSampleRateBuffer;
    QVector<QString> recommendChannelBuffer;
    QVector<QString> recommendResoultionBuffer;
    QVector<QString> recommendCodecBuffer;

    //save data to storage

    AudioFileFactory* m_fileFactory;
    RecordingChart* m_recordingChart;

    // data buffer in recording chart
    QVector<quint32> m_recordingChartBuffer;

    bool m_recStatus;
};

#endif // RECORDINGCONTROLLER_H
