#ifndef RECORDINGIO_H
#define RECORDINGIO_H


#include <QObject>
#include <qqml.h>
#include <QtCore/QIODevice>
#include <QtCore/QVector>
#include <QtCharts/QChartGlobal>
#include <QAudioFormat>
#include <qendian.h>
#include <QTimer>

class RecordingIO : public QIODevice
{
public:
    explicit RecordingIO(const QAudioFormat &format);
    Q_OBJECT
    // Q_PROPERTY(QVector<float> m_buffer READ getDataBuffer() NOTIFY bufferUpdated(value))
    QML_ELEMENT


    float getDataBuffer() const;
    void writeBufferToFile(QString filePath);
signals:
    void bufferUpdated(const QVector<float> &newBuffer);

protected:
    qint64 readData(char *data, qint64 maxSize) override;
    qint64 writeData(const char *data, qint64 maxSize) override;

private:
    const QAudioFormat m_format;
    quint32 m_maxAmplitude = 0;
    qreal m_level = 0.0; // 0.0 <= m_level <= 1.0
    static const int sampleCount = 400;
    QVector<float> m_buffer;
    QVector<float> firstBuffer;
    QVector<float> secondBuffer;
    int bufferPrivilenge;

    QTimer m_timer;

};

#endif // RECORDINGIO_H
