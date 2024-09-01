#include "audiofilefactory.h"

#include <QString>
#include <QDebug>


AudioFileFactory::AudioFileFactory(const QAudioFormat &format) 
    : m_format(format)
    , m_timer(nullptr)
{

}

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

void AudioFileFactory::createFile()
{
    qInfo() << "I'm creating an audio file";
    m_directory = "/home/gianghandsome/ESCA/ESCA_Qt/ESCA/data/";
    QString nameFile = m_directory.append('abc.wav'); // + time
    setFilePath(nameFile);
    saveDataToFile();
    m_dataBuffer.clear();
}



void AudioFileFactory::saveDataToFile()
{
    QFile file(getFilePath());
    if (file.open(QIODevice::WriteOnly)) {
        // writeWavHeader(file, buffer.size() * (m_format.sampleSize() / 8));
        writeWavHeader(file, 100000);

        QDataStream out(&file);
        out.setByteOrder(QDataStream::LittleEndian);

        for (auto sample : m_dataBuffer) {
            if (m_format.sampleSize() == 8) {
                out << quint32(sample);
            } else if (m_format.sampleSize() == 16) {
                out << quint16(sample);
            } else if (m_format.sampleSize() == 32) {
                out << quint32(sample);
            }
        }
      
        file.close();
    }
}

void AudioFileFactory::startTimer()
{
    m_timer = new QTimer(this);
    connect(m_timer, &QTimer::timeout, this, &AudioFileFactory::createFile);
    m_dataBuffer.clear();
    m_timer->start(m_fileDuration);
}


void AudioFileFactory::setFileDuration(int duration)
{
    if (m_fileDuration == duration)
        return;
    m_fileDuration = duration;
}

void AudioFileFactory::appendDataToBuffer(const QByteArray &data)
{
    const int32_t *samples = reinterpret_cast<const int32_t*>(data.constData());
    int sampleCount = data.size() / sizeof(int32_t);

    for (int i = 0; i < sampleCount; ++i)
        m_dataBuffer.append(samples[i]);
}


