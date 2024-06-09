#ifndef RECORDINGIO_H
#define RECORDINGIO_H


#include <QObject>
#include <qqml.h>
#include <QtCore/QIODevice>
#include <QtCore/QVector>
#include <QtCharts/QChartGlobal>

class RecordingIO : public QIODevice
{
public:
    explicit RecordingIO(QObject *parent = nullptr);
    Q_OBJECT
    Q_PROPERTY(QVector<float> m_buffer READ getDataBuffer() NOTIFY bufferUpdated(value))
    QML_ELEMENT


    float getDataBuffer() const;

signals:
    void bufferUpdated(const QVector<float> &newBuffer);

protected:
    qint64 readData(char *data, qint64 maxSize) override;
    qint64 writeData(const char *data, qint64 maxSize) override;

private:
    static const int sampleCount = 400;
    QVector<float> m_buffer;
};

#endif // RECORDINGIO_H
