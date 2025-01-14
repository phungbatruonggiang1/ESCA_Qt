#include "transferconfig.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QDebug>

TransferConfig::TransferConfig(QObject *parent)
    : QObject(parent),
    m_baseWeightPath(""),
    m_tfrecordUsedPath(""),
    m_tfrecordNewPath(""),
    m_savePath(""),
    m_batchSize(0),
    m_learningRate(0.0),
    m_epoch(0),
    m_beta(0.0)
{
}

QString TransferConfig::baseWeightPath() const { return m_baseWeightPath; }
void TransferConfig::setBaseWeightPath(const QString &path) { m_baseWeightPath = path; emit baseWeightPathChanged(); }

QString TransferConfig::tfrecordUsedPath() const { return m_tfrecordUsedPath; }
void TransferConfig::setTfrecordUsedPath(const QString &path) { m_tfrecordUsedPath = path; emit tfrecordUsedPathChanged(); }

QString TransferConfig::tfrecordNewPath() const { return m_tfrecordNewPath; }
void TransferConfig::setTfrecordNewPath(const QString &path) { m_tfrecordNewPath = path; emit tfrecordNewPathChanged(); }

QString TransferConfig::savePath() const { return m_savePath; }
void TransferConfig::setSavePath(const QString &path) { m_savePath = path; emit savePathChanged(); }

int TransferConfig::batchSize() const { return m_batchSize; }
void TransferConfig::setBatchSize(int size) { m_batchSize = size; emit batchSizeChanged(); }

double TransferConfig::learningRate() const { return m_learningRate; }
void TransferConfig::setLearningRate(double rate) { m_learningRate = rate; emit learningRateChanged(); }

int TransferConfig::epoch() const { return m_epoch; }
void TransferConfig::setEpoch(int epoch) { m_epoch = epoch; emit epochChanged(); }

double TransferConfig::beta() const { return m_beta; }
void TransferConfig::setBeta(double beta) { m_beta = beta; emit betaChanged(); }

bool TransferConfig::loadConfig(const QString &filePath) {
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file để đọc:" << filePath;
        loadDefaults();
        return false;
    }

    QByteArray data = file.readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isNull() || !doc.isObject()) {
        qWarning() << "File không hợp lệ.";
        loadDefaults();
        return false;
    }

    QJsonObject rootObject = doc.object();

    // Cập nhật các trường từ TRANSFER_LEARNING
    if (rootObject.contains("TRANSFER_LEARNING") && rootObject["TRANSFER_LEARNING"].isObject()) {
        QJsonObject transferLearning = rootObject["TRANSFER_LEARNING"].toObject();
        setBaseWeightPath(transferLearning.value("BASED_WEIGHTS").toString(m_baseWeightPath));
        setTfrecordNewPath(transferLearning.value("TFRECORDS").toArray().at(0).toString());
        setSavePath(transferLearning.value("SAVE_PATH").toString(m_savePath));
        setBatchSize(transferLearning.value("ANOM_BATCH_SIZE").toInt(m_batchSize));
        setLearningRate(transferLearning.value("LEARNING_RATE").toDouble(m_learningRate));
        setEpoch(transferLearning.value("EPOCH").toInt(m_epoch));
        setBeta(transferLearning.value("BETA").toDouble(m_beta));
    }

    // Cập nhật TFRecord Used Path từ DATASET
    if (rootObject.contains("DATASET") && rootObject["DATASET"].isObject()) {
        QJsonObject dataset = rootObject["DATASET"].toObject();
        if (dataset.contains("PATH") && dataset["PATH"].isObject()) {
            QJsonObject path = dataset["PATH"].toObject();
            setTfrecordUsedPath(path.value("TFRECORDS").toArray().at(0).toString(m_tfrecordUsedPath));
        }
    }

    return true;
}

bool TransferConfig::saveConfig(const QString &filePath) const {
    QFile file(filePath);
    QJsonObject rootObject;

    // Đọc cấu hình hiện tại từ file nếu tồn tại
    if (file.exists()) {
        if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << "Không thể mở file để đọc:" << filePath;
            return false;
        }
        QByteArray data = file.readAll();
        QJsonDocument doc = QJsonDocument::fromJson(data);

        if (!doc.isNull() && doc.isObject()) {
            rootObject = doc.object();
        }
        file.close();
    }

    // Cập nhật TRANSFER_LEARNING
    QJsonObject transferLearning = rootObject.value("TRANSFER_LEARNING").toObject();
    transferLearning["BASED_WEIGHTS"] = m_baseWeightPath;
    // transferLearning["TFRECORDS"] = QJsonArray{m_tfrecordNewPath};
    QJsonArray tfrecordsArray;
    tfrecordsArray.append(m_tfrecordNewPath);
    transferLearning["TFRECORDS"] = tfrecordsArray;
    transferLearning["SAVE_PATH"] = m_savePath;
    transferLearning["ANOM_BATCH_SIZE"] = m_batchSize;
    transferLearning["LEARNING_RATE"] = m_learningRate;
    transferLearning["EPOCH"] = m_epoch;
    transferLearning["BETA"] = m_beta;
    rootObject["TRANSFER_LEARNING"] = transferLearning;

    // Cập nhật DATASET -> PATH -> TFRECORDS
    if (rootObject.contains("DATASET") && rootObject["DATASET"].isObject()) {
        QJsonObject dataset = rootObject["DATASET"].toObject();
        QJsonObject path = dataset.value("PATH").toObject();
        // path["TFRECORDS"] = QJsonArray{m_tfrecordUsedPath};
        QJsonArray usedtfrecordsArray;
        usedtfrecordsArray.append(m_tfrecordUsedPath);
        path["TFRECORDS"] = tfrecordsArray;
        dataset["PATH"] = path;
        rootObject["DATASET"] = dataset;
    }

    // Ghi lại cấu hình vào file
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Không thể mở file để ghi:" << filePath;
        return false;
    }

    QJsonDocument doc(rootObject);
    file.write(doc.toJson());
    file.close();
    return true;
}

void TransferConfig::loadDefaults() {
    m_baseWeightPath = "./Results/tl-training_results/Target2/saved_model/vq_vae";
    m_tfrecordUsedPath = "/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/park_dataset_demo/mel_data";
    m_tfrecordNewPath = "./park_dataset_demo/target/Target3";
    m_savePath = "/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/./Results/tl-training_results/Target2";
    m_batchSize = 128;
    m_learningRate = 0.001;
    m_epoch = 81;
    m_beta = 1.0;
}
