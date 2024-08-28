#include "recordingchart.h"

RecordingChart::RecordingChart(QObject *parent) : QObject{parent}, spy(this, &RecordingChart::audioSeriesChanged)

{

}
RecordingChart::~RecordingChart() {
    // delete m_audioSeries;
}

void RecordingChart::updateData(const QVector<quint32> &data)
{
    setAudioSeries(data);
    qInfo() << "Hello";
}

QVector<quint32> RecordingChart::audioSeries() const
{
    return m_audioSeries;
}


quint32 RecordingChart::minhaudio() const
{
    return m_minhaudio;
}

void RecordingChart::setMinhaudio(quint32 newMinhaudio)
{
    // if (m_minhaudio == newMinhaudio)
    //     return;
    m_minhaudio = newMinhaudio;

    emit minhaudioChanged();

    qInfo() << "setMinhaudio c++:" << minhaudio();
}

void RecordingChart::setAudioSeries(const QVector<quint32> &newAudioSeries)
{
    // if (m_audioSeries == newAudioSeries)
    //     return;
    m_audioSeries = newAudioSeries;
    // QSignalSpy spy(this, &RecordingChart::audioSeriesChanged);

    emit audioSeriesChanged();

    qDebug() << "emit audioSeriesSig: " << spy.count() << "time";

    if (!newAudioSeries.isEmpty()) {
        qInfo() << "setAudioSeries c++:" << m_audioSeries.first() << minhaudio();
    } else {
        qInfo() << "setAudioSeries c++ empty";
    }
}

