#include "audiofile.h"
#include <QDebug>

AudioFile::AudioFile(const QString &outputDir,
                     const QAudioFormat &format,
                     double durationSeconds,
                     QObject *parent)
    : QObject(parent),
    m_outputDir(outputDir),
    m_audioFormat(format),
    m_durationSeconds(durationSeconds),
    // m_fileIndex(0),
    m_usingBuffer1(true)
{
    QDir dir("/home/haiminh/Desktop/ESCA_Qt/ESCA/data");
    if (!dir.exists()) {
        dir.mkpath(".");
    }

    // Tính toán chunkSize dựa trên cấu hình âm thanh và duration
    // chunkSize = sampleRate * bitsPerSample/8 * numChannels * durationSeconds
    m_chunkSize = static_cast<quint32>(
        m_audioFormat.sampleRate() *
        (m_audioFormat.sampleSize() / 8) *
        m_audioFormat.channelCount() *
        m_durationSeconds
        );

    // initial buffer with size fix with 1 chunksize
    m_buffer1.reserve(m_chunkSize);
    m_buffer2.reserve(m_chunkSize);

}

AudioFile::~AudioFile() {
    stopRecording();
    if (m_outFile.isOpen()) {
        m_outFile.close();

    }
}

void AudioFile::startRecording() {

    QMutexLocker locker(&m_mutex);
    if (m_outFile.isOpen()) {
        qWarning() << "Recording already in progress.";
        return;
    }
    // Tạo file mới để bắt đầu ghi âm
    createNewFile();

}

void AudioFile::stopRecording() {
    QMutexLocker locker(&m_mutex);
    if (m_outFile.isOpen()) {
        // dataSize thực tế (trừ đi 44 bytes header file wav)
        dataSize = m_outFile.size() - 44;
        finalizeWavHeader(dataSize);
        m_outFile.close();
        qDebug() << "Stopped recording. Finalized file with dataSize:" << dataSize;
    }
}

void AudioFile::createNewFile()
{
    QDateTime local(QDateTime::currentDateTime());
    // qInfo() << "I'm creating an audio file " << local.toTime_t();
    QString fileName = QString("%1/test-%2.wav").arg("/home/haiminh/Desktop/ESCA_Qt/ESCA/data").arg(local.toTime_t());

    m_outFile.setFileName(fileName);
    if (!m_outFile.open(QIODevice::WriteOnly)) {
        qWarning() << "Cannot open file for writing:" << fileName;
        return;
    }

    // Write WAV header with dataSize = 0 (updated sau)
    writeWavHeader(0);
    qDebug() << "Created file:" << fileName;
}

void AudioFile::writeWavHeader(quint32 dataSize) {
    QDataStream out(&m_outFile);
    out.setByteOrder(QDataStream::LittleEndian);  // WAV sử dụng little-endian

    // Ghi header RIFF
    out.writeRawData("RIFF", 4);
    out << static_cast<quint32>(36 + dataSize); // ChunkSize
    out.writeRawData("WAVE", 4);

    // Ghi "fmt " subchunk
    out.writeRawData("fmt ", 4);
    out << quint32(16);  // Kích thước subchunk1 (16 cho PCM)
    out << quint16(1);   // Audio format (PCM)
    out << quint16(m_audioFormat.channelCount());
    out << quint32(m_audioFormat.sampleRate());
    out << quint32(m_audioFormat.sampleRate() * m_audioFormat.channelCount() * (m_audioFormat.sampleSize() / 8));  // Byte rate
    out << quint16(m_audioFormat.channelCount() * (m_audioFormat.sampleSize() / 8));  // Block align
    out << quint16(m_audioFormat.sampleSize());    // Bits per sample

    // Ghi "data" subchunk
    out.writeRawData("data", 4);
    out << static_cast<quint32>(dataSize);
    qInfo()<<"end write header to wav file";
}

void AudioFile::writeDataForever(const QByteArray &data) {
    m_outFile.write(data);
    dataSize += data.size();
}

void AudioFile::writeAudioData(const QByteArray &data) {

    QMutexLocker locker(&m_mutex);

    QByteArray &currentBuffer = m_usingBuffer1 ? m_buffer1 : m_buffer2;
    currentBuffer.append(data);

    if (currentBuffer.size() >= m_chunkSize) {
        // Ghi dữ liệu vào file
        m_outFile.write(currentBuffer.left(m_chunkSize));
        m_outFile.flush(); // Đảm bảo dữ liệu được ghi ngay lập tức
        qDebug() << "Wrote" << m_chunkSize << "bytes to file:" << m_outFile.fileName();

        // Xóa dữ liệu đã ghi
        currentBuffer.remove(0, m_chunkSize);

        // Chuyển buffer
        m_usingBuffer1 = !m_usingBuffer1;

        // Tạo file mới
        createNewFile();
    }
    qDebug()<< "writeAudioData in audiofile: "<<data.at(0);
}


void AudioFile::finalizeWavHeader(quint32 dataSize) {
    if (!m_outFile.isOpen())
        return;

    // Update ChunkSize and DataSize in header
    m_outFile.seek(4);
    quint32 chunkSize = 36 + dataSize;
    QDataStream out(&m_outFile);
    out.setByteOrder(QDataStream::LittleEndian);
    out << chunkSize;

    // Update dataSize
    m_outFile.seek(40);
    out << dataSize;

    m_outFile.close();
    qDebug() << "Finalized file with dataSize:" << dataSize;
}

