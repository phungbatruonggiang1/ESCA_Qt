#include "audiofile.h"
#include <QDataStream>
#include <QDebug>

AudioFile::AudioFile() : dataSize(0) {
}

AudioFile::~AudioFile() {
    if (wavFile.isOpen()) {
        wavFile.close();
    }
}

bool AudioFile::startRecording(const QString &fileName, const QAudioFormat &format) {
    audioFormat = format;
    dataSize = 0;

    // Set folder data
    QDir::setCurrent("/home/haiminh/Desktop/minhtestmain/ESCA_Qt/ESCA/data");

    wavFile.setFileName(fileName);
    if (!wavFile.open(QIODevice::WriteOnly)) {
        return false;
    }

    writeWavHeader();

    return true;
}

void AudioFile::writeWavHeader() {
    QDataStream out(&wavFile);
    out.setByteOrder(QDataStream::LittleEndian);  // WAV sử dụng little-endian

    // Ghi header RIFF
    out.writeRawData("RIFF", 4);
    out << quint32(0);  // Placeholder cho kích thước file (cập nhật sau)
    out.writeRawData("WAVE", 4);

    // Ghi "fmt " subchunk
    out.writeRawData("fmt ", 4);
    out << quint32(16);  // Kích thước subchunk1 (16 cho PCM)
    out << quint16(1);   // Audio format (PCM)
    out << quint16(audioFormat.channelCount());
    out << quint32(audioFormat.sampleRate());
    out << quint32(audioFormat.sampleRate() * audioFormat.channelCount() * (audioFormat.sampleSize() / 8));  // Byte rate
    out << quint16(audioFormat.channelCount() * (audioFormat.sampleSize() / 8));  // Block align
    out << quint16(audioFormat.sampleSize());    // Bits per sample

    // Ghi "data" subchunk
    out.writeRawData("data", 4);
    out << quint32(0);  // Placeholder cho kích thước dữ liệu (cập nhật sau)
    qInfo()<<"write to wav file";
}

void AudioFile::writeAudioData(const QByteArray &data) {
    wavFile.write(data);
    dataSize += data.size();
}

void AudioFile::stopRecording() {
    finalizeWavHeader();
    wavFile.close();
}

void AudioFile::finalizeWavHeader() {
    wavFile.seek(4);
    QDataStream out(&wavFile);
    out.setByteOrder(QDataStream::LittleEndian);
    out << quint32(36 + dataSize);  // Tổng kích thước file

    wavFile.seek(40);
    out << quint32(dataSize);  // Kích thước dữ liệu
}
