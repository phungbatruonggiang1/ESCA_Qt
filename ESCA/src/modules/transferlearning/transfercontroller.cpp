#include "transfercontroller.h"
#include <QDebug>

TransferController::TransferController(QObject *parent)
    :QObject(parent),    
    m_rawLog(""),
    m_epoch(0),
    m_totalEpoch(0)
{
    transferProcMng = new TransferProcMng(this);
    m_histogram = new HistogramManager(this);
    m_prManager = new PRManager(this);
    m_rocManager = new ROCManager(this);

    qmlRegisterSingletonInstance("TransHistoImport", 1, 0, "TransHisto", m_histogram);
    qmlRegisterSingletonInstance("TransPRImport", 1, 0, "TransPR", m_prManager);
    qmlRegisterSingletonInstance("TransROCImport", 1, 0, "TransROC", m_rocManager);

    // Kết nối tín hiệu từ TransferProcMng tới TransferController
    connect(transferProcMng, &TransferProcMng::logUpdated, this, &TransferController::handleLogUpdated);
    connect(transferProcMng, &TransferProcMng::histogramUpdated, m_histogram, &HistogramManager::updateEpochData);
    connect(transferProcMng, &TransferProcMng::prCurveUpdated, m_prManager, &PRManager::computePRCurve);
    connect(transferProcMng, &TransferProcMng::rocCurveUpdated, m_rocManager, &ROCManager::computeROCCurve);

    // Kết nối tín hiệu khi process hoàn thành
    QObject::connect(transferProcMng, &TransferProcMng::finished, this, &TransferController::stop);
}

TransferController::~TransferController()
{
    stop();
}

void TransferController::start()
{
    // Đọc cấu hình
    // if (!configManager->loadConfig("python_ai/ai_module/config/config.json")) {
    //     qWarning() << "Failed to load configuration.";
    //     return;
    // }
    transferProcMng->startPythonService();
    setTlStatus(true);
}

void TransferController::stop()
{
    transferProcMng->stopPythonService();
    setTlStatus(false);
}

QString TransferController::rawLog() const
{
    return m_rawLog;
}

int TransferController::epoch() const
{
    return m_epoch;
}

int TransferController::totalEpoch() const
{
    return m_totalEpoch;
}

// void TransferController::handleLogUpdated(const QString &log, int epoch, int totalEpoch, const QVariantMap &details)
// {
//     m_rawLog = log;
//     m_epoch = epoch;
//     m_totalEpoch = totalEpoch;
//     // m_details = details;
//     double totalLoss = details.value("total_loss", 0.0).toDouble();
//     double reconstructionLoss = details.value("reconstruction_loss", 0.0).toDouble();
//     double modelLoss = details.value("model_loss", 0.0).toDouble();
//     double supervisedLoss = details.value("supervised_loss", 0.0).toDouble();
//     m_details = QString("totalLoss: %1; reconstructionLoss: %2;\n modelLoss: %3; supervisedLoss: %4")
//                     .arg(totalLoss)
//                     .arg(reconstructionLoss)
//                     .arg(modelLoss)
//                     .arg(supervisedLoss);

//     emit rawLogChanged();
//     emit totalEpochChanged();
//     emit detailsChanged();
//     emit epochChanged();
// }

void TransferController::handleLogUpdated(int epoch, int totalEpoch, const QString &stepType, const QVariantMap &details)
{
    QVariantMap logEntry;
    logEntry["epoch"] = epoch;
    logEntry["stepType"] = stepType;
    logEntry["totalLoss"] = details.value("total_loss", 0.0);
    logEntry["reconstructionLoss"] = details.value("reconstruction_loss", 0.0);
    logEntry["modelLoss"] = details.value("model_loss", 0.0);
    logEntry["supervisedLoss"] = details.value("supervised_loss", 0.0);

    double totalLoss = details.value("total_loss", 0.0).toDouble();
    double reconstructionLoss = details.value("reconstruction_loss", 0.0).toDouble();
    double modelLoss = details.value("model_loss", 0.0).toDouble();
    double supervisedLoss = details.value("supervised_loss", 0.0).toDouble();

    m_stepType = stepType;
    m_details = QString("totalLoss: %1; reconstructionLoss: %2; modelLoss: %3; supervisedLoss: %4")
                    .arg(totalLoss)
                    .arg(reconstructionLoss)
                    .arg(modelLoss)
                    .arg(supervisedLoss);

    m_logList.append(logEntry);
    emit logListChanged(); // Thông báo QML cập nhật giao diện
    if (epoch != m_epoch) {
        m_epoch = epoch;
        m_totalEpoch = totalEpoch;
        emit epochChanged();
        emit totalEpochChanged();
    }
}

QString TransferController::details() const
{
    return m_details;
}

QVariantList TransferController::logList() const
{
    return m_logList;
}

QString TransferController::stepType() const
{
    return m_stepType;
}

bool TransferController::tlStatus() const
{
    return m_tlStatus;
}

void TransferController::setTlStatus(bool newTlStatus)
{
    if (m_tlStatus == newTlStatus)
        return;
    m_tlStatus = newTlStatus;
    emit tlStatusChanged();
}
