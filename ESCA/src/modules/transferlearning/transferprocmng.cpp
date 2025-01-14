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

    setStatement("export PYTHONPATH=~/Desktop/Anomaly_Detection/D-ESCA_v2:$PYTHONPATH && python3 ~/Desktop/Anomaly_Detection/D-ESCA_v2/tools/tl_training.py                                                                       python3 ~/Desktop/Anomaly_Detection/D-ESCA_v2/tools/tl_training.py");
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

// void TransferProcMng::handleStandardOutput()
// {
//     QByteArray data = m_process.readAllStandardOutput().trimmed();
//     QString outputStr = QString::fromUtf8(data);

//     if (!data.isEmpty()) {
//         qInfo() << "Received from Python:" << data;
//         qInfo() << "outputStr Result:" << outputStr;

//         // Biến tạm để kiểm tra giá trị mới
//         int currentEpoch = m_epoch;
//         int currentTotalEpoch = m_totalEpoch;
//         QVariantMap currentDetails = m_details;

//         // Regex để tìm epoch
//         QRegularExpression epochRegex("Epoch (\\d+)/(\\d+)");
//         QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
//         if (epochMatch.hasMatch()) {
//             currentEpoch = epochMatch.captured(1).toInt();
//             currentTotalEpoch = epochMatch.captured(2).toInt();
//         }

//         // Regex để tìm các giá trị khác
//         QRegularExpression detailsRegex("total_loss: ([\\-\\d\\.e+]+) - reconstruction_loss: ([\\-\\d\\.e+]+) - model_loss: ([\\-\\d\\.e+]+) - supervised_loss: ([\\-\\d\\.e+]+)");
//         QRegularExpressionMatch detailsMatch = detailsRegex.match(outputStr);
//         if (detailsMatch.hasMatch()) {
//             currentDetails.insert("total_loss", detailsMatch.captured(1).toDouble());
//             currentDetails.insert("reconstruction_loss", detailsMatch.captured(2).toDouble());
//             currentDetails.insert("model_loss", detailsMatch.captured(3).toDouble());
//             currentDetails.insert("supervised_loss", detailsMatch.captured(4).toDouble());
//         }

//         // Cập nhật giá trị mới vào các biến thành viên
//         m_epoch = currentEpoch;
//         m_totalEpoch = currentTotalEpoch;
//         m_details = currentDetails;

//         // qDebug()<<"m_details"<<m_details;
//         // Gửi signal tới controller
//         emit logUpdated(outputStr, m_epoch, m_totalEpoch, m_details);
//     }
// }

void TransferProcMng::handleStandardOutput()
{
    QByteArray data = m_process.readAllStandardOutput().trimmed();
    QString outputStr = QString::fromUtf8(data);

    if (!data.isEmpty()) {
        qInfo() << "Received from Python:" << outputStr;

        // QRegularExpression epochRegex("Epoch (\\d+)/(\\d+)");
        QRegularExpression stepRegex("(Train step|Val step|Test step)");
        QRegularExpression lossRegex("total_loss: ([\\-\\d\\.e+]+) - reconstruction_loss: ([\\-\\d\\.e+]+) - model_loss: ([\\-\\d\\.e+]+) - supervised_loss: ([\\-\\d\\.e+]+)");

        int currentEpoch = m_epoch;
        int currentTotalEpoch = m_totalEpoch;
        QString stepType;
        QVariantMap details;

        // Phân tích epoch
        // QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
        // if (epochMatch.hasMatch()) {
        //     epoch = epochMatch.captured(1).toInt();
        // }
        // QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
        // if (epochMatch.hasMatch()) {
        //     currentEpoch = epochMatch.captured(1).toInt();
        //     // m_totalEpoch = epochMatch.captured(2).toInt();
        //     if (currentEpoch != m_epoch) {
        //         m_epoch = currentEpoch; // Chỉ cập nhật nếu có giá trị mới
        //         // emit epochUpdated(m_epoch);
        //     }
        // }

        // Regex để tìm epoch
        QRegularExpression epochRegex("Epoch (\\d+)/(\\d+)");
        QRegularExpressionMatch epochMatch = epochRegex.match(outputStr);
        if (epochMatch.hasMatch()) {
            currentEpoch = epochMatch.captured(1).toInt();
            currentTotalEpoch = epochMatch.captured(2).toInt();

            if (currentEpoch != m_epoch || currentTotalEpoch != m_totalEpoch) {
                m_epoch = currentEpoch;
                m_totalEpoch = currentTotalEpoch;
                // emit epochUpdated(m_epoch, m_totalEpoch);
            }
        }

        // Phân tích step type
        QRegularExpressionMatch stepMatch = stepRegex.match(outputStr);
        if (stepMatch.hasMatch()) {
            stepType = stepMatch.captured(1);
        }

        // Phân tích các giá trị loss
        QRegularExpressionMatch lossMatch = lossRegex.match(outputStr);
        if (lossMatch.hasMatch()) {
            details.insert("total_loss", lossMatch.captured(1).toDouble());
            details.insert("reconstruction_loss", lossMatch.captured(2).toDouble());
            details.insert("model_loss", lossMatch.captured(3).toDouble());
            details.insert("supervised_loss", lossMatch.captured(4).toDouble());
        }

        emit logUpdated(m_epoch, m_totalEpoch, stepType, details); // Gửi signal tới Controller
    }
}


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
