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
#include <QMutex>

class RecordingIO : public QIODevice
{
    Q_OBJECT

public:
    explicit RecordingIO(const QAudioFormat &format, QObject *parent = nullptr);
    
signals:
    void dataReady(const QList<qreal> &buffer);

protected:
    qint64 readData(char *data, qint64 maxSize) override;
    qint64 writeData(const char *data, qint64 maxSize) override;

private:
    void writeWavHeader(QFile &file, qint64 dataSize);

    const QAudioFormat m_format;
    quint32 m_maxAmplitude = 0;
    qreal m_level = 0.0; // 0.0 <= m_level <= 1.0
    static const int sampleCount = 400;

    QMutex bufferMutex;
    QVector<quint32> dataBuffer;
    QTimer m_timer;
};

#endif // RECORDINGIO_H
