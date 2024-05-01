#include "dynamicchart.h"

DynamicChart::DynamicChart(QObject *parent) : QIODevice(parent)
{

}

int DynamicChart::getResolution() const
{
    return resolution;
}

void DynamicChart::setResolution(int newResolution)
{
    resolution = newResolution;
}

int DynamicChart::getSampleCount() const
{
    return sampleCount;
}

void DynamicChart::setSampleCount(int newSampleCount)
{
    sampleCount = newSampleCount;
}

float DynamicChart::getData() const {
    return m_buffer[0];
}

qint64 DynamicChart::readData(char *data, qint64 maxSize)
{
    Q_UNUSED(data)
    Q_UNUSED(maxSize)
    return -1;
}


qint64 DynamicChart::writeData(const char *data, qint64 maxSize)
{
    int availableSamples = maxSize / resolution;
    int newDataStartIndex = qMax(0, (availableSamples - sampleCount));

    if (m_buffer.isEmpty()) {
        m_buffer.reserve(sampleCount);
        for (int i = 0; i < sampleCount; ++i)
            m_buffer.append(0.0);
    }

    int start = 0;
    for (int i = availableSamples - 1; i >= newDataStartIndex; i--){
        float value = float(quint8(data[resolution * i]) - 128) / 1.28f;
        m_buffer[start] = value;
        start++;
    }
    emit bufferUpdated(m_buffer);

    return maxSize;
}
