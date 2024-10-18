    #ifndef AUDIOCONFIG_H
#define AUDIOCONFIG_H

#include <QObject>
#include <QDebug>
#include <QAudioDeviceInfo>
#include <QAudioFormat>
#include <QVariantMap>
#include <QStringList>
#include <QSettings>
#include <QGuiApplication>

class AudioConfig : public QObject
{
    Q_OBJECT
    
    Q_PROPERTY(QStringList listDevices READ listDevices WRITE setListDevices NOTIFY listDevicesChanged FINAL)
    Q_PROPERTY(QList<int> listSampleRate READ listSampleRate WRITE setListSampleRate NOTIFY listSampleRateChanged FINAL)
    Q_PROPERTY(QList<int> listChannel READ listChannel WRITE setListChannel NOTIFY listChannelChanged FINAL)
    Q_PROPERTY(QStringList listCodecs READ listCodecs WRITE setListCodecs NOTIFY listCodecsChanged FINAL)
    Q_PROPERTY(QList<QAudioFormat::Endian> listEndianz READ listEndianz WRITE setListEndianz NOTIFY listEndianzChanged FINAL)
    Q_PROPERTY(QList<int> listSampleSize READ listSampleSize WRITE setListSampleSize NOTIFY listSampleSizeChanged FINAL)
    Q_PROPERTY(QStringList listDuration READ listDuration NOTIFY listDurationChanged FINAL)
    Q_PROPERTY(QStringList listOutput READ listOutput WRITE setListOutput NOTIFY listOutputChanged FINAL)

    Q_PROPERTY(QList<int> nearistParams READ nearistParams NOTIFY nearistParamsChanged FINAL)

    Q_PROPERTY(bool saveDone READ saveDone WRITE setSaveDone NOTIFY saveDoneChanged FINAL)

public:
    explicit AudioConfig(QObject *parent = nullptr);
    ~AudioConfig();

    QStringList listDevices() const;
    void setListDevices(const QStringList &newListDevices);

    QList<int> listSampleRate() const;
    void setListSampleRate(const QList<int> &newListSampleRate);

    QList<int> listChannel() const;
    void setListChannel(const QList<int> &newListChannel);

    QStringList listCodecs() const;
    void setListCodecs(const QStringList &newListCodecs);

    QList<QAudioFormat::Endian> listEndianz() const;
    void setListEndianz(const QList<QAudioFormat::Endian> &newListEndianz);

    QList<int> listSampleSize() const;
    void setListSampleSize(const QList<int> &newListSampleSize);

    Q_INVOKABLE void changeDevice(int idx);
    Q_INVOKABLE void saveConfig(int device, int codec, int sampleRate, int channel, int endian, int sampleSize, int duration);

    QAudioDeviceInfo deviceInfo();
    QAudioFormat format();
    QString duration();

    QList<int> nearistParams()/* const { return m_nearistParams; }*/;

    bool saveDone() /*const*/;
    void setSaveDone(bool newSaveDone);

    void saveSettings();

    QStringList listDuration() const;
    void setlistDuration(const QStringList &newListDuration);

    QStringList listOutput() const;
    void setListOutput(const QStringList &newListOutput);

signals:
    void listCodecsChanged();
    void listSampleRateChanged();
    void listChannelChanged();
    void listEndianzChanged();
    void listDevicesChanged();
    void listSampleSizeChanged();

    void nearistParamsChanged();

    void saveDoneChanged();

    void listDurationChanged();

    void listOutputChanged();

private:
    QAudioDeviceInfo m_deviceInfo;
    QAudioDeviceInfo m_OutputInfo;
    QAudioFormat m_format;
    QList<QAudioDeviceInfo> cpplistDevices;
    QList<QAudioDeviceInfo> cpplistOutput;

    QStringList listDevicesName;
    QStringList m_listDevices;
    QStringList m_listOutput;
    QList<int> m_listSampleRate;
    QList<int> m_listChannel;
    QStringList m_listCodecs;
    QList<QAudioFormat::Endian> m_listEndianz;
    QList<int> m_listSampleSize;
    QStringList m_listDuration = {"10s", "Forever"};

    QList<int> m_nearistParams;
    QSettings m_settings;
    bool m_saveDone = true;


};

#endif // AUDIOCONFIG_H
