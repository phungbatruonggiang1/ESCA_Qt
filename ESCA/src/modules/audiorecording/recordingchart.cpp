#include "recordingchart.h"

RecordingChart::RecordingChart(QObject *parent)
    : QObject(parent)
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

void RecordingChart::setAudioSeries(const QVector<quint32> &newAudioSeries)
{
    m_audioSeries = newAudioSeries;
    emit audioSeriesChanged();
}

