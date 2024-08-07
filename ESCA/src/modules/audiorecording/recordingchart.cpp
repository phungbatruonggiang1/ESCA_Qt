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
    for (int value : data) {
        m_audioSeries.append(value);
    }
    this->setMinhaudio(m_audioSeries.value(0, -1));

    if (!data.isEmpty()) {
        qInfo() << "updateData rcChart c++:" << data.at(0) << m_audioSeries.value(0, -1) << minhaudio();
    } else {
        qInfo() << "recordingchart c++ empty";
    }
}

QVariant RecordingChart::updateDataQml()
{
    // if (!m_minhaudio) {
    //     qInfo() << "updateDataQml:" << this->minhaudio();
    // } else {
    //     qInfo() << "to qml empty";
    // }
    // return this->minhaudio();
}

QVector<int> RecordingChart::audioSeries() const
{
    return m_audioSeries;
}

void RecordingChart::setAudioSeries(const QVector<int> &newAudioSeries)
{
    if (m_audioSeries == newAudioSeries)
        return;
    m_audioSeries = newAudioSeries;
    emit audioSeriesChanged();
}

int RecordingChart::minhaudio() const
{
    return m_minhaudio;
}

void RecordingChart::setMinhaudio(int newMinhaudio)
{
    if (m_minhaudio == newMinhaudio)
        return;
    m_minhaudio = newMinhaudio;
    emit minhaudioChanged();
}
