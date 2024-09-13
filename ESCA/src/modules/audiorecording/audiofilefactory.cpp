#include "audiofilefactory.h"

#include <QProcess>
#include <QDebug>


AudioFileFactory::AudioFileFactory(const QAudioFormat &format) 
    : m_format(format)
    , m_cachingTimer(nullptr)
    , m_fileTimer(nullptr)
    , numberOfCaptures(0)
    , fileDataSize(0)
    , m_directory("/home/gianghandsome/ESCA/ESCA_Qt/ESCA/data/")
{

}

// void AudioFileFactory::writeWavHeader(qint64 dataSize)
// {
//     QFile file(getFilePath());
//     QDataStream out();

//     out.setByteOrder(QDataStream::LittleEndian);

//     // RIFF header
//     out.writeRawData("RIFF", 4);
//     out << quint32(dataSize + 36);  // File size - 8 bytes
//     out.writeRawData("WAVE", 4);

//     // fmt chunk
//     out.writeRawData("fmt ", 4);
//     out << quint32(16);  // Chunk size
//     out << quint16(1);   // Audio format (PCM)
//     out << quint16(m_format.channelCount());
//     out << quint32(m_format.sampleRate());
//     out << quint32(m_format.sampleRate() * m_format.channelCount() * (m_format.sampleSize() / 8));
//     out << quint16(m_format.channelCount() * (m_format.sampleSize() / 8));
//     out << quint16(m_format.sampleSize());

//     // data chunk
//     out.writeRawData("data", 4);
//     out << quint32(dataSize);
// }

void AudioFileFactory::updateWavHeader()
{

}


void AudioFileFactory::createFile()
{
    if (!m_dataBuffer.isEmpty()) {
        qInfo() << "Error, please check again!";
        releaseBuffer();
    }

    if (fileDataSize > 0) {
        
    }
    QDateTime local(QDateTime::currentDateTime());
    // qInfo() << "I'm creating an audio file " << local.toTime_t();
    QString nameFile = m_directory;
    nameFile.append("test-");
    nameFile.append(local.toTime_t());
    nameFile.append(".wav");
    setFilePath(nameFile);
    fileDataSize = 0;
    // writeWavHeader(5000000);
}
    

void AudioFileFactory::releaseBuffer()
{
    qInfo() << "release buffer in file factory";
    numberOfCaptures ++;
    fileDataSize += m_dataBuffer.size() * (m_format.sampleSize() / 8);
    qInfo() << fileDataSize;
    saveDataToFile();
    m_dataBuffer.clear();
}



void AudioFileFactory::saveDataToFile()
{
    QFile file(getFilePath());
    if (file.open(QIODevice::Append)) {
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

void AudioFileFactory::startRecording()
{
    m_fileTimer = new QTimer(this);
    m_cachingTimer = new QTimer(this);
    connect(m_fileTimer, &QTimer::timeout, this, &AudioFileFactory::createFile);
    connect(m_cachingTimer, &QTimer::timeout, this, &AudioFileFactory::releaseBuffer);

    m_dataBuffer.clear();
    m_fileTimer->start(m_fileDuration);
    m_cachingTimer->start(1000);
    createFile();
}

void AudioFileFactory::stopRecording() 
{
    releaseBuffer();
    m_fileTimer->stop();
    m_cachingTimer->stop();
    disconnect(m_fileTimer, &QTimer::timeout, this, &AudioFileFactory::createFile);
    disconnect(m_cachingTimer, &QTimer::timeout, this, &AudioFileFactory::releaseBuffer);
}


void AudioFileFactory::setFileDuration(int duration)
{
    if (m_fileDuration == duration)
        return;
    m_fileDuration = duration;
}

void AudioFileFactory::appendDataToBuffer(const QByteArray &data)
{
    if (m_format.sampleSize() == 8) {
        const int8_t *samples = reinterpret_cast<const int8_t*>(data.constData());
        int numberOfSamples = data.size() / sizeof(int16_t);
        for (int i = 0; i < numberOfSamples; ++i)
            m_dataBuffer.append(samples[i]);
    } 
    else if (m_format.sampleSize() == 16) {
        const int16_t *samples = reinterpret_cast<const int16_t*>(data.constData());
        int numberOfSamples = data.size() / sizeof(int16_t);
        for (int i = 0; i < numberOfSamples; ++i)
            m_dataBuffer.append(samples[i]);
    } 
    else if (m_format.sampleSize() == 32) {
        const int32_t *samples = reinterpret_cast<const int32_t*>(data.constData());
        int numberOfSamples = data.size() / sizeof(int32_t);
        for (int i = 0; i < numberOfSamples; ++i)
            m_dataBuffer.append(samples[i]);
    }
}




