    #include "recordingio.h"
#include <QFile>
#include <QDataStream>

RecordingIO::RecordingIO(const QAudioFormat &format) : m_format(format)
{
    // qDebug()<< m_buffer;
    m_timer.setInterval(3);
    m_timer.setSingleShot(false);
    m_timer.start(1000);
    connect(&m_timer, &QTimer::timeout, this, [this]() {
        QFile file("/home/haiminh/Desktop/ESCA_Qt/ESCA/database/test.wav");
        if(bufferPrivilenge == 0) {
            bufferPrivilenge = 1;
            writeBufferToFile(file, firstBuffer);
            firstBuffer.clear();
        } else {
            bufferPrivilenge = 0;
            writeBufferToFile(file, secondBuffer);
            secondBuffer.clear();
        }
    });
    bufferPrivilenge = 0;
    switch (m_format.sampleSize()) {
    case 8:
        switch (m_format.sampleType()) {
        case QAudioFormat::UnSignedInt:
            m_maxAmplitude = 255;
            break;
        case QAudioFormat::SignedInt:
            m_maxAmplitude = 127;
            break;
        default:
            break;
        }
        break;
    case 16:
        switch (m_format.sampleType()) {
        case QAudioFormat::UnSignedInt:
            m_maxAmplitude = 65535;
            break;
        case QAudioFormat::SignedInt:
            m_maxAmplitude = 32767;
            break;
        default:
            break;
        }
        break;
    case 32:
        switch (m_format.sampleType()) {
        case QAudioFormat::UnSignedInt:
            m_maxAmplitude = 0xffffffff;
            break;
        case QAudioFormat::SignedInt:
            m_maxAmplitude = 0x7fffffff;
            break;
        case QAudioFormat::Float:
            m_maxAmplitude = 0x7fffffff; // Kind of
        default:
            break;
        }
        break;
    default:
        break;
    }
}

qint64 RecordingIO::readData(char *data, qint64 maxSize)
{
    Q_UNUSED(data)
    Q_UNUSED(maxSize)
    return -1;
}

qint64 RecordingIO::writeData(const char *data, qint64 maxSize)
{
    if (m_maxAmplitude) {
        Q_ASSERT(m_format.sampleSize() % 8 == 0);
        const int channelBytes = m_format.sampleSize() / 8;
        const int sampleBytes = m_format.channelCount() * channelBytes;
        Q_ASSERT(maxSize % sampleBytes == 0);
        const int numSamples = maxSize / sampleBytes;

        quint32 maxValue = 0;
        const unsigned char *ptr = reinterpret_cast<const unsigned char *>(data);

        for (int i = 0; i < numSamples; ++i) {
            for (int j = 0; j < m_format.channelCount(); ++j) {
                quint32 value = 0;

                if (m_format.sampleSize() == 8 && m_format.sampleType() == QAudioFormat::UnSignedInt) {
                    value = *reinterpret_cast<const quint8*>(ptr);
                } else if (m_format.sampleSize() == 8 && m_format.sampleType() == QAudioFormat::SignedInt) {
                    value = qAbs(*reinterpret_cast<const qint8*>(ptr));
                } else if (m_format.sampleSize() == 16 && m_format.sampleType() == QAudioFormat::UnSignedInt) {
                    if (m_format.byteOrder() == QAudioFormat::LittleEndian)
                        value = qFromLittleEndian<quint16>(ptr);
                    else
                        value = qFromBigEndian<quint16>(ptr);
                } else if (m_format.sampleSize() == 16 && m_format.sampleType() == QAudioFormat::SignedInt) {
                    if (m_format.byteOrder() == QAudioFormat::LittleEndian)
                        value = qAbs(qFromLittleEndian<qint16>(ptr));
                    else
                        value = qAbs(qFromBigEndian<qint16>(ptr));
                } else if (m_format.sampleSize() == 32 && m_format.sampleType() == QAudioFormat::UnSignedInt) {
                    if (m_format.byteOrder() == QAudioFormat::LittleEndian)
                        value = qFromLittleEndian<quint32>(ptr);
                    else
                        value = qFromBigEndian<quint32>(ptr);
                } else if (m_format.sampleSize() == 32 && m_format.sampleType() == QAudioFormat::SignedInt) {
                    if (m_format.byteOrder() == QAudioFormat::LittleEndian)
                        value = qAbs(qFromLittleEndian<qint32>(ptr));
                    else
                        value = qAbs(qFromBigEndian<qint32>(ptr));
                } else if (m_format.sampleSize() == 32 && m_format.sampleType() == QAudioFormat::Float) {
                    value = qAbs(*reinterpret_cast<const float*>(ptr) * 0x7fffffff); // assumes 0-1.0
                }
                if(bufferPrivilenge == 0)
                    firstBuffer.append(value);
                else {
                    secondBuffer.append(value);
                }
                maxValue = qMax(value, maxValue);
                ptr += channelBytes;
            }
        }

        maxValue = qMin(maxValue, m_maxAmplitude);
        m_level = qreal(maxValue) / m_maxAmplitude;
    }

    // emit update();
    // qInfo() << maxSize;
    return maxSize;
}

void RecordingIO::writeWavHeader(QFile &file, qint64 dataSize)
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

void RecordingIO::writeBufferToFile(QFile &file, const QVector<quint32> &buffer)
{
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

QVector<quint32> RecordingIO::getDataBuffer() {
    qDebug()<<firstBuffer;
    return secondBuffer;
}
