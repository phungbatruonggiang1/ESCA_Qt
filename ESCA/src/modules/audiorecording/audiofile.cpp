#include "audiofile.h"
#include <QDebug>

constexpr quint32 WAV_HEADER_SIZE = 44;

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
    // QDir dir("/home/haiminh/Desktop/ESCA_Qt/ESCA/data");
    QDir dir(m_outputDir);
    if (!dir.exists()) {
        if (!dir.mkpath(".")) {
            qWarning() << "Failed to create output directory:" << m_outputDir;
        }
    }

    // Tính toán chunkSize dựa trên cấu hình âm thanh và duration
    // chunkSize = sampleRate * bitsPerSample/8 * numChannels * durationSeconds
    m_chunkSize = static_cast<quint32>(
        m_audioFormat.sampleRate() *
        (m_audioFormat.sampleSize() / 8) *
        m_audioFormat.channelCount() *
        m_durationSeconds
        );   

    // initial buffer with size fix with 1 chunksize; 1 buffer is 1 file
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

    createFile();
}

void AudioFile::stopRecording() {
    QMutexLocker locker(&m_mutex);
    if (m_outFile.isOpen()) {

        // ghi nốt data còn trong buffer vào file trước ghi stop
        QByteArray &currentBuffer = m_usingBuffer1 ? m_buffer1 : m_buffer2;
        m_outFile.write(currentBuffer.left(m_chunkSize));
        m_outFile.flush(); // Đảm bảo dữ liệu được ghi ngay lập tức
        qDebug() << "Wrote" << m_chunkSize << "bytes to file:" << m_outFile.fileName();

        // dataSize thực tế (trừ đi 44 bytes header file wav)
        dataSize = currentBuffer.size();
        finalizeWavHeader(dataSize);
        m_outFile.close();
        qDebug() << "Stopped recording. Finalized file with dataSize:" << dataSize;
    }
}

void AudioFile::createFile()
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
    // QDataStream out(&m_outFile);
    // out.setByteOrder(QDataStream::LittleEndian);  // WAV sử dụng little-endian

    // // Ghi header RIFF
    // out.writeRawData("RIFF", 4);
    // out << static_cast<quint32>(36 + dataSize); // ChunkSize
    // out.writeRawData("WAVE", 4);

    // // Ghi "fmt " subchunk
    // out.writeRawData("fmt ", 4);
    // out << quint32(16);  // Kích thước subchunk1 (16 cho PCM)
    // out << quint16(1);   // Audio format (PCM)
    // out << quint16(m_audioFormat.channelCount());
    // out << quint32(m_audioFormat.sampleRate());
    // out << quint32(m_audioFormat.sampleRate() * m_audioFormat.channelCount() * (m_audioFormat.sampleSize() / 8));  // Byte rate
    // out << quint16(m_audioFormat.channelCount() * (m_audioFormat.sampleSize() / 8));  // Block align
    // out << quint16(m_audioFormat.sampleSize());    // Bits per sample

    // // Ghi "data" subchunk
    // out.writeRawData("data", 4);
    // out << static_cast<quint32>(dataSize);

    QByteArray header;
    header.resize(WAV_HEADER_SIZE);
    char *ptr = header.data();

    // RIFF header
    memcpy(ptr, "RIFF", 4);
    ptr += 4;
    quint32 chunkSize = 36 + dataSize;
    memcpy(ptr, &chunkSize, 4);
    ptr += 4;
    memcpy(ptr, "WAVE", 4);
    ptr += 4;

    // fmt subchunk
    memcpy(ptr, "fmt ", 4);
    ptr += 4;
    quint32 subchunk1Size = 16;
    memcpy(ptr, &subchunk1Size, 4);
    ptr += 4;
    quint16 audioFormat = 1; // PCM
    memcpy(ptr, &audioFormat, 2);
    ptr += 2;
    quint16 numChannels = m_audioFormat.channelCount();
    memcpy(ptr, &numChannels, 2);
    ptr += 2;
    quint32 sampleRate = m_audioFormat.sampleRate();
    memcpy(ptr, &sampleRate, 4);
    ptr += 4;
    quint32 byteRate = sampleRate * numChannels * (m_audioFormat.sampleSize() / 8);
    memcpy(ptr, &byteRate, 4);
    ptr += 4;
    quint16 blockAlign = numChannels * (m_audioFormat.sampleSize() / 8);
    memcpy(ptr, &blockAlign, 2);
    ptr += 2;
    quint16 bitsPerSample = m_audioFormat.sampleSize();
    memcpy(ptr, &bitsPerSample, 2);
    ptr += 2;

    // data subchunk
    memcpy(ptr, "data", 4);
    ptr += 4;
    memcpy(ptr, &dataSize, 4);

    // Write header to file
    m_outFile.seek(0);
    m_outFile.write(header);

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

        // Fill in dataSize into header, finalize current file's WAV header
        finalizeWavHeader(m_outFile.size()-44);

        // Xóa dữ liệu đã ghi
        currentBuffer.remove(0, m_chunkSize);

        // Chuyển buffer
        m_usingBuffer1 = !m_usingBuffer1;

        // Tạo file mới
        createFile();
    }
    // qDebug()<< "writeAudioData in audiofile: "<<data.at(0);
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

