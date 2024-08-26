#ifndef RECORDINGCHART_H
#define RECORDINGCHART_H

#include <QObject>
#include <QDebug>
#include <QVariant>
#include <QSignalSpy>
#include <QQmlEngine>

class RecordingChart : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QVector<quint32> audioSeries READ audioSeries WRITE setAudioSeries NOTIFY audioSeriesChanged FINAL)
    Q_PROPERTY(quint32 minhaudio READ minhaudio WRITE setMinhaudio NOTIFY minhaudioChanged FINAL)

public:
    explicit RecordingChart(QObject *parent = nullptr);
    ~RecordingChart();

    void updateData(const QVector<quint32> &data);

    QVector<quint32> audioSeries() const;

    quint32 minhaudio() const;
    void setMinhaudio(quint32 newMinhaudio);

    void setAudioSeries(const QVector<quint32> &newAudioSeries);

signals:
    void audioSeriesChanged();
    void minhaudioChanged();

private:

    QVector<quint32> m_audioSeries;
    quint32 m_minhaudio = 0;
    QSignalSpy spy;
};

#endif // RECORDINGCHART_H
