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
    int currentEpoch = 0;
    // Đọc tất cả dữ liệu có sẵn từ tiến trình
    QByteArray data = m_process.readAll();
    m_buffer += QString::fromUtf8(data);
    // qInfo()<<"Full log: "<<m_buffer;

    QRegularExpression histRegex(R"(\[HIST\]\s*([\d,\.eE+-]+))");
    QRegularExpression prRegex(R"(\[PR\](\[\[.*?\]\])(?=\r?\n|$))");
    QRegularExpression rocRegex(R"(\[ROC\](\[\[.*?\]\])(?=\r?\n|$))");

    int lastMatchEnd = 0;

    // 1. Xử lý Progress Log    
    QRegularExpression epochRegex("Epoch\\s+(\\d+)/(\\d+)");
    QRegularExpression stepRegex("(Train step|Val step|Test step)");
    QRegularExpression lossRegex("total_loss:\\s+([\\-\\d\\.e+]+)\\s+-\\s+reconstruction_loss:\\s+([\\-\\d\\.e+]+)\\s+-\\s+model_loss:\\s+([\\-\\d\\.e+]+)\\s+-\\s+supervised_loss:\\s+([\\-\\d\\.e+]+)");

    // Dùng globalMatch để lấy tất cả các match của epoch
    QRegularExpressionMatchIterator epochIt = epochRegex.globalMatch(m_buffer);

    while (epochIt.hasNext()) {
        QRegularExpressionMatch epochMatch = epochIt.next();
        currentEpoch = epochMatch.captured(1).toInt();
        int currentTotalEpoch = epochMatch.captured(2).toInt();

        // Tìm step type và loss tương ứng, bắt đầu tìm từ vị trí sau match của epoch hiện tại
        int searchPos = epochMatch.capturedEnd();

        // Lấy tất cả các bước (step) trong block của epoch hiện tại
        QRegularExpressionMatchIterator stepIt = stepRegex.globalMatch(m_buffer, searchPos);
        QString stepTypes;
        while (stepIt.hasNext()) {
            QRegularExpressionMatch stepMatch = stepIt.next();
            stepTypes = stepMatch.captured(1);
        }

        // Tìm thông tin loss: sử dụng match từ vị trí searchPos
        QRegularExpressionMatch lossMatch = lossRegex.match(m_buffer, searchPos);
        QVariantMap details;
        if (lossMatch.hasMatch()) {
            details.insert("total_loss", lossMatch.captured(1).toDouble());
            details.insert("reconstruction_loss", lossMatch.captured(2).toDouble());
            details.insert("model_loss", lossMatch.captured(3).toDouble());
            details.insert("supervised_loss", lossMatch.captured(4).toDouble());
        }

        emit logUpdated(currentEpoch, currentTotalEpoch, stepTypes, details);
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
            // qInfo() << "fpr:" << fpr;
            // qInfo() << "tpr:" <<tpr;
        } else {
            qWarning() << "Invalid ROC JSON:" << match.captured(1);
        }
        lastMatchEnd = match.capturedEnd();
    }
}

void TransferProcMng::handleProcessFinished(int exitCode, QProcess::ExitStatus exitStatus)
{
    qInfo() << "Python process finished with exit code:" << exitCode;
    if (exitStatus == QProcess::CrashExit) {
        qWarning() << "Python process crashed!";
    }
}

void TransferProcMng::setScriptPath(const QString &path)
{
    m_scriptPath = path;
}

QString TransferProcMng::scriptPath() const
{
    return m_scriptPath;
}
