    #ifndef AUDIOENGINE_H
#define AUDIOENGINE_H


#include <QAudioDeviceInfo>
#include <QAudioFormat>
#include <QBuffer>
#include <QByteArray>
#include <QDir>
#include <QObject>
#include <QVector>
#include <QtCore/qiodevice.h>
// #include "controller/audiocontroller.h"

QT_BEGIN_NAMESPACE
class QAudioInput;
class QAudioOutput;
class QAudioDeviceInfo;
QT_END_NAMESPACE



// struct audio properties

struct AudioInstance {
    QString inputDevice;
    QString outputDevice;
    QString saveAudioLocation;
    int numberOfChannels;
    int sampleRate;
    int resolution;
    int duration;
};

class AudioEngine : public QObject {
    Q_OBJECT
public:
    explicit AudioEngine(QAudioFormat formatAudioInput, QObject *parent = 0);
    ~AudioEngine();

    const QVector<QString> availableAudioInputDevices() const
    { return m_inputDevice; }

    const QVector<QString> availableAudioOutputDevices() const
    { return m_outputDevice; }

    void setInputBufferSize(int value);
    void audioInputStop();
    // void startAudioInput();

   void setAudioInputDevice(QString device);
   void setAudioOutputDevice(const QString device);
   void setAudioParameters (const QVector<QString> &configValue);




   QVector<QString> getsupportedCodecList() const;

   signals:
    void inputDeviceSig(QVector<QString>& m_inputDevice);


private:
    QAudioFormat m_inputFormat;
    QAudioFormat* m_outputFormat = nullptr;
    QVector<QString> m_supportedCodecList;



    QAudioInput* m_audioInput = nullptr;
    QAudioOutput* m_audioOutput = nullptr;
    QList<QAudioDeviceInfo> m_availableAudioInputDevices;
    QList<QAudioDeviceInfo> m_availableAudioOutputDevices;
    QVector<QString> m_outputDevice;
    QVector<QString> m_inputDevice;


    // audio properties instance
    AudioInstance audioParameters;






};

#endif // AUDIOENGINE_H
