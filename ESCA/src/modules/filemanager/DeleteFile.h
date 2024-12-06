#ifndef DELETEFILE_H
#define DELETEFILE_H

#include <QObject>
#include <QFile>
#include <QAbstractListModel>
#include <QDir>
#include <QFileInfoList>

class FolderListModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit FolderListModel(QObject *parent = nullptr);

    void refresh();
private:
    QString currentFolder;
    QList<QFileInfo> fileList;
};

class DeleteFile : public QObject {
    Q_OBJECT

public:
    explicit DeleteFile(QObject *parent = nullptr);

    Q_INVOKABLE bool fileExists(const QString &filePath);
    Q_INVOKABLE bool removeFile(const QString &filePath);
};

#endif // DELETEFILE_H
