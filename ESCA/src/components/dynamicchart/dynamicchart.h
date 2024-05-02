#ifndef DYNAMICCHART_H
#define DYNAMICCHART_H

#include <QObject>
#include <qqml.h>
#include <QtCore/QIODevice>
#include <QtCore/QVector>
#include <QtCharts/QChartGlobal>

class DynamicChart : public QIODevice
{
    Q_OBJECT
    Q_PROPERTY(float getData READ getData() NOTIFY bufferUpdated(value))
    QML_ELEMENT
public:
    explicit DynamicChart(QObject* parent = nullptr);

    QVector<float> getBuffer() const {
        return m_buffer;
    }

    int getSampleCount() const;
    void setSampleCount(int newSampleCount);

    int getResolution() const;
    void setResolution(int newResolution);

signals:
    void bufferUpdated(const QVector<float>& newBuffer);

protected:
    qint64 readData(char *data, qint64 maxSize) override;
    qint64 writeData(const char *data, qint64 maxSize) override;

private:
    QVector<float> m_buffer;
    int sampleCount;
    int resolution;
    float getData() const;

};

#endif // DYNAMICCHART_H
