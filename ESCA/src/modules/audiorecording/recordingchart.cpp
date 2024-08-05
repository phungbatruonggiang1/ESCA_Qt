#include "recordingchart.h"

RecordingChart::RecordingChart(QObject *parent)
    : QObject(parent), m_audioSeries(new QLineSeries(this))
{

}
RecordingChart::~RecordingChart() {
    // delete m_audioSeries;
}

void RecordingChart::updateData(const QList<qreal> &data)
{
    if (m_audioSeries) {
        for (const qreal &value : data) {
            m_audioSeries->append(m_audioSeries->count(), value);
        }

        // Giữ cho biểu đồ linh hoạt, giới hạn số lượng điểm dữ liệu
        if (m_audioSeries->count() > 100) {
            m_audioSeries->remove(0, m_audioSeries->count() - 100);
        }
    }
    emit audioSeriesChanged();
    // qInfo()<<"dataBuffer controller property:" << m_audioSeries;
}


QLineSeries *RecordingChart::audioSeries() const
{
    return m_audioSeries;
}

void RecordingChart::setAudioSeries(QLineSeries *newAudioSeries)
{
    if (m_audioSeries == newAudioSeries)
        return;
    m_audioSeries = newAudioSeries;
    emit audioSeriesChanged();
}
