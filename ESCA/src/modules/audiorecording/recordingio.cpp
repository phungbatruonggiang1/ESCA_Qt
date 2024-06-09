#include "recordingio.h"




RecordingIO::RecordingIO() : public QIODevice {

}


qint64 RecordingIO::readData(char *data, qint64 maxSize)
{
    Q_UNUSED(data)
    Q_UNUSED(maxSize)
    return -1;
}

qint64 RecordingIO::writeData(const char *data, qint64 maxSize)
{
    static const int resolution = 4;
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

float RecordingIO::getDataBuffer() const {
    return m_buffer[0];
}
