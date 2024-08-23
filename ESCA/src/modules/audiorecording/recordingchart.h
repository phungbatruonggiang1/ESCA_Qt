#ifndef RECORDINGCHART_H
#define RECORDINGCHART_H

#include <QObject>
#include <QDebug>
#include <QVariant>


class RecordingChart : public QObject
{
    Q_OBJECT

public:
    explicit RecordingChart(QObject *parent = nullptr);
    ~RecordingChart();

    Q_PROPERTY(QVector<quint32> audioSeries READ audioSeries WRITE setAudioSeries NOTIFY audioSeriesChanged)

    void updateData(const QVector<quint32> &data);

    QVector<quint32> audioSeries() const { return m_audioSeries; }
    void setAudioSeries(const QVector<quint32> &newAudioSeries);

signals:
    void audioSeriesChanged();

private:

    QVector<quint32> m_audioSeries;
};

#endif // RECORDINGCHART_H
