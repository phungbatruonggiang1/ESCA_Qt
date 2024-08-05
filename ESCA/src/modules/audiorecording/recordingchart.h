#ifndef RECORDINGCHART_H
#define RECORDINGCHART_H

#include <QObject>
#include <QtCharts/QChartView>
#include <QtCharts/QLineSeries>


QT_CHARTS_USE_NAMESPACE


class RecordingChart : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QLineSeries* audioSeries READ audioSeries WRITE setAudioSeries NOTIFY audioSeriesChanged FINAL)

public:
    explicit RecordingChart(QObject *parent = nullptr);
    ~RecordingChart();

    QLineSeries *audioSeries() const;
    void setAudioSeries(QLineSeries *newAudioSeries);

public slots:
    void updateData(const QList<qreal> &data);

signals:
    void audioSeriesChanged();
private:
    QLineSeries *m_audioSeries = nullptr;
};

#endif // RECORDINGCHART_H
