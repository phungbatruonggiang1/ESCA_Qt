#include "audiofilefactory.h"

AudioFileFactory::AudioFileFactory() {}



void AudioFileFactory::writeWavHeader(QFile &file, qint64 dataSize)
{
    QDataStream out(&file);
    out.setByteOrder(QDataStream::LittleEndian);

    // RIFF header
    out.writeRawData("RIFF", 4);
    out << quint32(dataSize + 36);  // File size - 8 bytes
    out.writeRawData("WAVE", 4);

    // fmt chunk
    out.writeRawData("fmt ", 4);
    out << quint32(16);  // Chunk size
    out << quint16(1);   // Audio format (PCM)
    out << quint16(m_format.channelCount());
    out << quint32(m_format.sampleRate());
    out << quint32(m_format.sampleRate() * m_format.channelCount() * (m_format.sampleSize() / 8));
    out << quint16(m_format.channelCount() * (m_format.sampleSize() / 8));
    out << quint16(m_format.sampleSize());

    // data chunk
    out.writeRawData("data", 4);
    out << quint32(dataSize);
}

void AudioFileFactory::saveDataToFile(const QVector<QString> data)
{
    QFile file(getFilePath());
    if (file.open(QIODevice::WriteOnly)) {
        writeWavHeader(file, buffer.size() * (m_format.sampleSize() / 8));

        QDataStream out(&file);
        out.setByteOrder(QDataStream::LittleEndian);

        for (auto sample : buffer) {
            if (m_format.sampleSize() == 8) {
                out << quint8(sample);
            } else if (m_format.sampleSize() == 16) {
                out << quint16(sample);
            } else if (m_format.sampleSize() == 32) {
                out << quint32(sample);
            }
        }
        file.close();
    }
}



