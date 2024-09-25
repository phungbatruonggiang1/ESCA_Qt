#include "DeleteFile.h"

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

FileIO::FileIO(QObject *parent): QObject(parent) {

}

bool FileIO::fileExists(const QString &filePath) {
    QFile file(filePath);
    return file.exists();
}

bool FileIO::removeFile(const QString &filePath) {
    QFile file(filePath);
    return file.remove();
}
