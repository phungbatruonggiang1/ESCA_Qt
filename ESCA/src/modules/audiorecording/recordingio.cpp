#include "recordingio.h"
#include <QFile>


RecordingIO::RecordingIO(const QAudioFormat &format) : m_format(format)
{
    m_timer.setInterval(3);
    m_timer.setSingleShot(false);
    m_timer.start(1000);
    connect(&m_timer, &QTimer::timeout, this, [this]() {
        QFile file("/home/gianghandsome/ESCA/ESCA_Qt/ESCA/database/test.txt");
        if(bufferPrivilenge == 0) {
            bufferPrivilenge = 1;
            // write buffer 1 to file
            if (file.open(QIODevice::WriteOnly))
            {
                QTextStream out(&file);
                for(int i = 0; i < firstBuffer.size(); i++) {
                    out << firstBuffer[i] << "\n";
                }
                file.close();
            }
            firstBuffer.clear();
        }
        else {
            bufferPrivilenge = 0;
            // write buffer 2 to file
            if (file.open(QIODevice::WriteOnly))
            {
                QTextStream out(&file);
                for(int i = 0; i < secondBuffer.size(); i++) {
                    out << secondBuffer[i] << "\n";
                }
                file.close();
            }
            firstBuffer.clear();
        }
    }
);



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
    qInfo() << maxSize;
    return maxSize;
}


float RecordingIO::getDataBuffer() const {
    return m_buffer[0];
}

void RecordingIO::writeBufferToFile(QString filePath)
{
    QFile file(filePath);
    if(bufferPrivilenge == 0) {
        bufferPrivilenge = 1;
        // write buffer 1 to file
        if (file.open(QIODevice::WriteOnly))
        {
            QTextStream out(&file);
            for(int i = 0; i < firstBuffer.size(); i++) {
                out << firstBuffer[i] << "\n";
            }
            file.close();
        }
        firstBuffer.clear();
    }
    else {
        bufferPrivilenge = 0;
        // write buffer 2 to file
        if (file.open(QIODevice::WriteOnly))
        {
            QTextStream out(&file);
            for(int i = 0; i < secondBuffer.size(); i++) {
                out << secondBuffer[i] << "\n";
            }
            file.close();
        }
        firstBuffer.clear();
    }
}
