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
#include <QFile>

class RecordingIO : public QIODevice
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit RecordingIO(const QAudioFormat &format);
    float getDataBuffer() const;
    void writeBufferToFile(QFile &file, const QVector<quint32> &buffer);

signals:
    void bufferUpdated(const QVector<float> &newBuffer);

protected:
    qint64 readData(char *data, qint64 maxSize) override;
    qint64 writeData(const char *data, qint64 maxSize) override;

private:
    void writeWavHeader(QFile &file, qint64 dataSize);

    const QAudioFormat m_format;
    quint32 m_maxAmplitude = 0;
    qreal m_level = 0.0; // 0.0 <= m_level <= 1.0
    static const int sampleCount = 400;
    QVector<float> m_buffer;
    QVector<quint32> firstBuffer;
    QVector<quint32> secondBuffer;
    int bufferPrivilenge;

    QTimer m_timer;
};

#endif // RECORDINGIO_H
