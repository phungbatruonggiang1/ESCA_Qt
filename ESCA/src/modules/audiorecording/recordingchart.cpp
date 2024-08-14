#include "recordingchart.h"

RecordingChart::RecordingChart(QObject *parent)
    : QObject(parent), m_minhaudio(0)
{

}
RecordingChart::~RecordingChart() {
    // delete m_audioSeries;
}

void RecordingChart::updateData(const QVector<quint32> &data)
{
    setAudioSeries(data);
    setMinhaudio(data.isEmpty() ? 17 : data.first());

    if (!m_audioSeries.isEmpty()) {
        qInfo() << "updateData rcChart c++:" << data.first() << m_audioSeries.first() << minhaudio();
    } else {
        qInfo() << "updateData c++ empty";
    }
}

QVector<quint32> RecordingChart::audioSeries() const
{
    return m_audioSeries;
}

void RecordingChart::setAudioSeries(const QVector<quint32> &newAudioSeries)
{
    // if (m_audioSeries == newAudioSeries)
    //     return;
    m_audioSeries = newAudioSeries;
    emit audioSeriesChanged();

    if (!newAudioSeries.isEmpty()) {
        qInfo() << "setAudioSeries c++:" << m_audioSeries.first() << minhaudio();
    } else {
        qInfo() << "setAudioSeries c++ empty";
    }
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
