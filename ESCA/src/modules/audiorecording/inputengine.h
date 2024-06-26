#ifndef INPUTENGINE_H
#define INPUTENGINE_H


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
    QString codec;
    int numberOfChannels;
    int sampleRate;
    int resolution;
};

class InputEngine : public QObject {
    Q_OBJECT
public:
    // explicit AudioEngine(QAudioFormat formatAudioInput, QObject *parent = 0);
    explicit InputEngine(QAudioDeviceInfo deviceInfoInput, QAudioFormat formatAudioInput, QObject *parent = 0);
    ~InputEngine();

    void setInputBufferSize(int value);
    void audioInputStop();
    void startAudioInput(QIODevice* device);

   void setAudioInputDevice(QString device);
   void setAudioOutputDevice(const QString device);
   void setAudioParameters (const QVector<QString> &configValue);




   QVector<QString> getsupportedCodecList() const;

   QString getSaveFileLocation() const;
   void setSaveFileLocation(const QString &newSaveFileLocation);

   int getDuration() const;
   void setDuration(int newDuration);

   signals:
    void inputDeviceSig(QVector<QString>& m_inputDevice);


private:
    QAudioFormat* m_outputFormat = nullptr;
    QVector<QString> m_supportedCodecList;



    QAudioInput* m_audioInput = nullptr;
    QAudioOutput* m_audioOutput = nullptr;



    // audio properties instance
    AudioInstance audioParameters;


    QString saveFileLocation;
    int duration;





};

#endif // INPUTENGINE_H
