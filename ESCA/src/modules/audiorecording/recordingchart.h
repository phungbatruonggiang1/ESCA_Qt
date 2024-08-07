#ifndef RECORDINGCHART_H
#define RECORDINGCHART_H

#include <QObject>
#include <QDebug>
#include <QVariant>


class RecordingChart : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<int> audioSeries READ audioSeries WRITE setAudioSeries NOTIFY audioSeriesChanged FINAL)
    Q_PROPERTY(int minhaudio READ minhaudio WRITE setMinhaudio NOTIFY minhaudioChanged FINAL)

public:
    explicit RecordingChart(QObject *parent = nullptr);
    ~RecordingChart();

    Q_INVOKABLE QVariant updateDataQml();

    void updateData(const QVector<quint32> &data);

    QVector<int> audioSeries() const;
    void setAudioSeries(const QVector<int> &newAudioSeries);

    int minhaudio() const;
    void setMinhaudio(int newMinhaudio);

signals:
    void audioSeriesChanged();

    void minhaudioChanged();

private:

    QVector<int> m_audioSeries;
    int m_minhaudio;
};

#endif // RECORDINGCHART_H
