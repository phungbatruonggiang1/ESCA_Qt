#include "DeleteFile.h"

#include <QObject>
#include <QFile>
#include <QAbstractListModel>
#include <QDir>
#include <QFileInfoList>

FolderListModel::FolderListModel(QObject *parent):QAbstractListModel(parent) {
    refresh();
}

void FolderListModel::refresh() {
     beginResetModel();
        // Refresh list view
        QDir dir(currentFolder);
        QFileInfoList files = dir.entryInfoList(QDir::NoDotAndDotDot | QDir::AllEntries);
        fileList.clear();
        for (const QFileInfo &fileInfo : files) {
            fileList.append(fileInfo);
        }
        endResetModel();
}

DeleteFile::DeleteFile(QObject *parent): QObject(parent) {

}

bool DeleteFile::fileExists(const QString &filePath) {
    QFile file(filePath);
    return file.exists();
}

bool DeleteFile::removeFile(const QString &filePath) {
    QFile file(filePath);
    return file.remove();
}