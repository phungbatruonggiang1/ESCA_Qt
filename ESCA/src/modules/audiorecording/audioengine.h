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

class AudioEngine : public QObject {
    Q_OBJECT
public:
    explicit AudioEngine(const QAudioDeviceInfo &deviceInfoInput, QAudioFormat formatAudioInput, QObject *parent = 0);
    ~AudioEngine();

    const QList<QAudioDeviceInfo> &availableAudioInputDevices() const
    { return m_availableAudioInputDevices; }

    const QList<QAudioDeviceInfo> &availableAudioOutputDevices() const
    { return m_availableAudioOutputDevices; }

    void setInputBufferSize(int value);
    void audioInputStop();
    void startAudioInput(QIODevice *device);

    QList<QAudioDeviceInfo> m_availableAudioInputDevices;

    //    QAudio::Mode mode() const { return m_mode; }
    //    QAudio::State state()     const { return m_state; }

    /**
     * Load data from WAV file
     */
    //    bool loadFile(const QString &fileName);

    /**
     * Length of the internal engine buffer.
     * \return Buffer length in bytes.
     */

    //    qint64 bufferLength() const;

    /**
     * Amount of data held in the buffer.
     * \return Data length in bytes.
     */

    //public slots:
    //    void setAudioInputDevice(const QAudioDeviceInfo &device);
    //    void setAudioOutputDevice(const QAudioDeviceInfo &device);


private:

    QAudioInput*        m_audioInput = nullptr;

    QList<QAudioDeviceInfo> m_availableAudioOutputDevices;
    QAudioOutput*       m_audioOutput = nullptr;

    //    QVector<QString>& m_inputDevice;

signals:
    void inputDeviceSig(QVector<QString>& m_inputDevice);

};

#endif // AUDIOENGINE_H
