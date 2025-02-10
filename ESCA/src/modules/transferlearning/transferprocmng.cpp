#include "transferprocmng.h"
#include <QDebug>

TransferProcMng::TransferProcMng(QObject *parent)
    : Process(parent)
    // m_scriptPath("/home/haiminh/Desktop/rt_test.py -cfg /home/haiminh/Desktop/params.yaml -f /home/haiminh/Desktop/temp.csv") // Đường dẫn mặc định
{
    connect(&m_process, &QProcess::readyRead, this, &TransferProcMng::handleStandardOutput);
}

TransferProcMng::~TransferProcMng()
{
    stopPythonService();
}

void TransferProcMng::startPythonService()
{
    qInfo() << Q_FUNC_INFO;

    qDebug() << "Current working directory:" << QDir::currentPath();

    setStatement("export PYTHONPATH=~/Desktop/Anomaly_Detection/D-ESCA_v2:$PYTHONPATH && python3 ~/Desktop/Anomaly_Detection/D-ESCA_v2/tools/tl_training.py");
    // setStatement("python3 ../../../../python_ai/inference/shared_memory_reader.py");

    qInfo() << statement();

    startProcess();
    start();
}

void TransferProcMng::stopPythonService()
{
    qInfo() << Q_FUNC_INFO;
    stop();
}

void TransferProcMng::handleStandardOutput()
{
    // Đọc tất cả dữ liệu có sẵn từ tiến trình
    QByteArray data = m_process.readAll();
    m_buffer += QString::fromUtf8(data);
    // qInfo()<<"Full log: "<<m_buffer;

    // Biểu thức chính quy cho từng loại log
    QRegularExpression progRegex(R"(\[PROG\](.*?)(?=\r?\n|$))");
    QRegularExpression histRegex(R"(\[HIST\]\s*([\d,\.eE+-]+))");
    QRegularExpression prRegex(R"(\[PR\](\[\[.*?\]\])(?=\r?\n|$))");
    QRegularExpression rocRegex(R"(\[ROC\](\[\[.*?\]\])(?=\r?\n|$))");

    int lastMatchEnd = 0;

    // 1. Xử lý Progress Log
    QRegularExpressionMatchIterator progIt = progRegex.globalMatch(m_buffer);
    while (progIt.hasNext()) {
        QRegularExpressionMatch match = progIt.next();
        QString progress = match.captured(1).trimmed();
        qDebug() << "Progress:" << progress;
        emit progressUpdated(progress);
        lastMatchEnd = match.capturedEnd();
    }

    // 2. Xử lý Histogram Log
    QRegularExpressionMatchIterator histIt = histRegex.globalMatch(m_buffer);
    while (histIt.hasNext()) {
        QRegularExpressionMatch match = histIt.next();
        QString dataStr = match.captured(1);  // Lấy phần số ra

        QStringList valuesStr = dataStr.split(",", Qt::SkipEmptyParts);
        QVector<double> values;
        for (const QString &val : valuesStr) {
            values.append(val.toDouble());
        }
        // qDebug() << "Histogram Values:" << values;
        emit histogramUpdated(values);
        lastMatchEnd = match.capturedEnd();
    }

    // 3. Xử lý PR Curve Log
    QRegularExpressionMatchIterator prIt = prRegex.globalMatch(m_buffer);
    while (prIt.hasNext()) {
        QRegularExpressionMatch match = prIt.next();
        QJsonDocument doc = QJsonDocument::fromJson(match.captured(1).toUtf8());        
        if (doc.isArray()) {
            QJsonArray arr = doc.array();
            QVector<double> recall, precision;
            for (const QJsonValue &val : arr[0].toArray()) {
                recall.append(val.toDouble());
            }
            for (const QJsonValue &val : arr[1].toArray()) {
                precision.append(val.toDouble());
            }
            emit prCurveUpdated(recall, precision);
            // qInfo() << "PR recall:" << recall;
            // qInfo() << "PR precision:" <<precision;
        } else {
            qWarning() << "Invalid PR JSON:" << match.captured(1);
        }
        lastMatchEnd = match.capturedEnd();
    }

    // 4. Xử lý ROC Curve Log
    QRegularExpressionMatchIterator rocIt = rocRegex.globalMatch(m_buffer);
    while (rocIt.hasNext()) {
        QRegularExpressionMatch match = rocIt.next();
        QJsonDocument doc = QJsonDocument::fromJson(match.captured(1).toUtf8());
        if (doc.isArray()) {
            QJsonArray arr = doc.array();
            QVector<double> fpr, tpr;
            for (const QJsonValue &val : arr[0].toArray()) {
                fpr.append(val.toDouble());
            }
            for (const QJsonValue &val : arr[1].toArray()) {
                tpr.append(val.toDouble());
            }
            emit rocCurveUpdated(fpr, tpr);
            qInfo() << "fpr:" << fpr;
            qInfo() << "tpr:" <<tpr;
        } else {
            qWarning() << "Invalid ROC JSON:" << match.captured(1);
        }
        lastMatchEnd = match.capturedEnd();
    }
}

// void TransferProcMng::handleStandardOutput()
// {
//     QByteArray data = m_process.readAllStandardOutput().trimmed();
//     QString outputStr = QString::fromUtf8(data);

//     if (!data.isEmpty()) {
//         qInfo() << "Received from Python:" << outputStr;

//         // QRegularExpression epochRegex("Epoch (\\d+)/(\\d+)");
//         QRegularExpression stepRegex("(Train step|Val step|Test step)");
//         QRegularExpression lossRegex("total_loss: ([\\-\\d\\.e+]+) - reconstruction_loss: ([\\-\\d\\.e+]+) - model_loss: ([\\-\\d\\.e+]+) - supervised_loss: ([\\-\\d\\.e+]+)");

//         int currentEpoch = m_epoch;
//         int currentTotalEpoch = m_totalEpoch;
//         QString stepType;
//         QVariantMap details;

//         // Phân tích epoch
//         // QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
//         // if (epochMatch.hasMatch()) {
//         //     epoch = epochMatch.captured(1).toInt();
//         // }
//         // QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
//         // if (epochMatch.hasMatch()) {
//         //     currentEpoch = epochMatch.captured(1).toInt();
//         //     // m_totalEpoch = epochMatch.captured(2).toInt();
//         //     if (currentEpoch != m_epoch) {
//         //         m_epoch = currentEpoch; // Chỉ cập nhật nếu có giá trị mới
//         //         // emit epochUpdated(m_epoch);
//         //     }
//         // }

//         // Regex để tìm epoch
//         QRegularExpression epochRegex("Epoch (\\d+)/(\\d+)");
//         QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
//         if (epochMatch.hasMatch()) {
//             currentEpoch = epochMatch.captured(1).toInt();
//             currentTotalEpoch = epochMatch.captured(2).toInt();

//             if (currentEpoch != m_epoch || currentTotalEpoch != m_totalEpoch) {
//                 m_epoch = currentEpoch;
//                 m_totalEpoch = currentTotalEpoch;
//                 // emit epochUpdated(m_epoch, m_totalEpoch);
//             }
//         }

//         // Phân tích step type
//         QRegularExpressionMatch stepMatch = stepRegex.match(outputStr);
//         if (stepMatch.hasMatch()) {
//             stepType = stepMatch.captured(1);
//         }

//         // Phân tích các giá trị loss
//         QRegularExpressionMatch lossMatch = lossRegex.match(outputStr);
//         if (lossMatch.hasMatch()) {
//             details.insert("total_loss", lossMatch.captured(1).toDouble());
//             details.insert("reconstruction_loss", lossMatch.captured(2).toDouble());
//             details.insert("model_loss", lossMatch.captured(3).toDouble());
//             details.insert("supervised_loss", lossMatch.captured(4).toDouble());
//         }

//         emit logUpdated(m_epoch, m_totalEpoch, stepType, details); // Gửi signal tới Controller
//     }
// }


void TransferProcMng::handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    qInfo() << "Python process finished with exit code:" << exitCode;
    if (exitStatus == QProcess::CrashExit) {
        qWarning() << "Python process crashed!";
    }
    // Có thể xử lý khi tiến trình kết thúc hoặc có lỗi
}

void TransferProcMng::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString TransferProcMng::scriptPath() const
{
    return m_scriptPath;
}
