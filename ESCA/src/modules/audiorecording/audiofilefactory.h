// #ifndef AUDIOFILEFACTORY_H
// #define AUDIOFILEFACTORY_H

// #include <QObject>
// #include <QString>
// #include <QAudioFormat>
// #include <QDataStream>
// #include <qendian.h>
// #include <QTimer>
// #include <QFile>
// #include <QDateTime>

// class AudioFileFactory /*: public AccessFile*/
// {

//     Q_OBJECT
    
// public:
//     explicit AudioFileFactory(const QAudioFormat &format);
//     void createFile();
//     void saveDataToFile();
//     // void writeWavHeader(qint64 dataSize);
//     void updateWavHeader();

//     const QAudioFormat m_format;

//     void startRecording();
//     void stopRecording();
//     void setFileDuration(int duration);
//     // int getFileDuration() const { return m_fileDuration; };
//     void setDirectoryToSaveAduioFile(QString path);
//     // QString getDirectorySaveAudioFile() const { return m_directory; };
//     void appendDataToBuffer(const QByteArray &data);
//     void releaseBuffer();


// private:
//     QTimer* m_cachingTimer;
//     QTimer* m_fileTimer;
//     int m_fileDuration;
//     int fileDataSize;
//     int numberOfCaptures;
//     QString m_directory;
//     QVector<int> m_dataBuffer;

// };

// #endif // AUDIOFILEFACTORY_H
