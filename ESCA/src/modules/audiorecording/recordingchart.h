#ifndef RECORDINGCHART_H
#define RECORDINGCHART_H

#include <QObject>
#include <QDebug>
#include <QVariant>

class CircuitBuffer {

public:
    explicit CircuitBuffer();

    void add(float value);
    std::vector<float> getBuffer() const;

    size_t size() const;

private:
    std::vector<float> buffer;
    size_t head, tail;
    bool isFull;
};

class RecordingChart : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant audioSeries READ audioSeries WRITE setAudioSeries NOTIFY audioSeriesChanged FINAL)

public:
    explicit RecordingChart(QObject *parent = nullptr);
    ~RecordingChart();

    void updateData(const QVector<quint32> &data);


    QVariant audioSeries() const;
    void setAudioSeries(const QVariant &newAudioSeries);

public slots:
    void onSendChartData(const QByteArray &data);

signals:
    void audioSeriesChanged();

private:
    QVariant m_audioSeries = {};

    CircuitBuffer buffer;
    int displayDataCount = 500;

};

#endif // RECORDINGCHART_H
