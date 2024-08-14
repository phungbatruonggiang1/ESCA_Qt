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

    Q_PROPERTY(QVector<quint32> audioSeries READ audioSeries WRITE setAudioSeries NOTIFY audioSeriesChanged FINAL)
    Q_PROPERTY(quint32 minhaudio READ minhaudio WRITE setMinhaudio NOTIFY minhaudioChanged FINAL)

    void updateData(const QVector<quint32> &data);

    QVector<quint32> audioSeries() const;
    void setAudioSeries(const QVector<quint32> &newAudioSeries);

    quint32 minhaudio() const;
    void setMinhaudio(quint32 newMinhaudio);

signals:
    void audioSeriesChanged();
    void minhaudioChanged();

private:

    QVector<quint32> m_audioSeries;
    quint32 m_minhaudio;
};

#endif // RECORDINGCHART_H
