#include "systemresourcecontroller.h"
#include <QDebug>
#include <QProcess>

SystemResourceController::SystemResourceController(QObject *parent) : QObject{parent} {
    qDebug() << "Instance created";
    m_ping = getNetworkPing();
    m_timer.setInterval(3);
    m_timer.setSingleShot(false);
    m_timer.start(1000);
    connect(&m_timer, &QTimer::timeout, this, [this]() {

        // For cpu
        m_cpu = getCpu();

        // For ram
        m_ram = getRam();

        // For disk
        m_disk = getDisk();

        // Both
        emit cpuChanged();
        emit ramChanged();
        emit diskChanged();
    });
}

SystemResourceController::~SystemResourceController() {
    m_timer.stop();
    qDebug() << "Instance destroyed";
}

double SystemResourceController::getDisk() {
    QStorageInfo storage = QStorageInfo::root();
    return static_cast<double>(storage.bytesTotal()-storage.bytesAvailable())/storage.bytesTotal() * 100;
}

//----------------------------------------
// Some function for ram/cpu/gpu
//----------------------------------------

int SystemResourceController::parseLine(char* line){
    // This assumes that a digit will be found and the line ends in " Kb".
    int i = strlen(line);
    const char* p = line;
    while (*p <'0' || *p > '9') p++;
    line[i-3] = '\0';
    i = atoi(p);
    return i;
}
double SystemResourceController::getRam(){
    //Note: this value is in KB!
    FILE* file = fopen("/proc/meminfo", "r");
    int memFree = -1;
    int memTotal = -1;
    char line[128];

    while (fgets(line, 128, file) != NULL){
        if (strncmp(line, "MemFree:", 6) == 0){
            memFree = parseLine(line);
        }
        if (strncmp(line, "MemTotal:", 6) == 0){
            memTotal = parseLine(line);
        }
    }
    fclose(file);
    return static_cast<double>(memTotal-memFree)/memTotal * 100;
}

double SystemResourceController::getCpu()
{
    double percent;
    FILE* file;
    unsigned long long totalUser, totalUserLow, totalSys, totalIdle, total;

    file = fopen("/proc/stat", "r");
    fscanf(file, "cpu %llu %llu %llu %llu", &totalUser, &totalUserLow,
           &totalSys, &totalIdle);
    fclose(file);

    if (totalUser < lastTotalUser || totalUserLow < lastTotalUserLow ||
        totalSys < lastTotalSys || totalIdle < lastTotalIdle){
        //Overflow detection. Just skip this value.
        percent = 0;
    }
    else{
        total = (totalUser - lastTotalUser) + (totalUserLow - lastTotalUserLow) +
                (totalSys - lastTotalSys);
        percent = total;
        total += (totalIdle - lastTotalIdle);
        percent /= total;
        percent *= 100;
    }

    lastTotalUser = totalUser;
    lastTotalUserLow = totalUserLow;
    lastTotalSys = totalSys;
    lastTotalIdle = totalIdle;

    return percent;
}

QString SystemResourceController::getCpuName() {
    FILE* file = fopen("/proc/cpuinfo", "r");
    char line[128];

    while (fgets(line, 128, file) != NULL){
        if (strncmp(line, "model name", 10) == 0){
            char* p = line;
            while(*p != ':') {
                p++;
            }
            return QString::fromUtf8(p).trimmed();
        }
    }
    fclose(file);
    return "Unknown CPU";
}

//Function for network ping

QString SystemResourceController::getGateway() {
    QProcess process;
    QString gateway;
    process.start("ip", QStringList() << "route");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
    }

    QString output = process.readAll();
    QStringList lines = output.split("\n");

    for (const QString &line : lines) {
        if (line.contains("default via")) {
            QStringList parts = line.split(" ");
            gateway = parts[2];
            break;
        }
    }
    return gateway;
}

double SystemResourceController::getNetworkPing() {
    QString gateway = getGateway();

    QProcess process;
    double pingValue = -1.0;

    process.start("ping", QStringList() << "-c 1" << gateway);
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
    }

    QString output = process.readAll();
    QStringList lines = output.split("\n");

    for (const QString &line : lines) {
        if (line.contains("time=")) {
            QStringList parts = line.split(" ");
            for (const QString &part : parts) {
                if (part.startsWith("time=")) {
                    QString pingString = part.mid(5);
                    pingValue = pingString.toDouble();
                }
            }
            break;
        }
    }
    return pingValue;
}

void SystemResourceController::updateNetworkPing() {
    m_ping = getNetworkPing();
    emit networkPingChanged();
}

//Function to get cache
int SystemResourceController::getCacheL1() {
    QProcess process;
    int L1i_cache = 0;
    int L1d_cache = 0;
    int L1_cache = 0;

    process.start("lscpu", QStringList() << "-C");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
    }

    QString output = process.readAll();
    QStringList lines = output.split("\n");

    for (const QString &line : lines) {
        if (line.startsWith("L1d")) {
            QStringList parts = line.split(" ",Qt::SkipEmptyParts);
            QStringList L1d = parts[2].split("K");
            L1d_cache = L1d[0].toInt();
        }
        if (line.startsWith("L1i")) {
            QStringList parts = line.split(" ",Qt::SkipEmptyParts);
            QStringList L1i = parts[2].split("K");
            L1i_cache = L1i[0].toInt();
        }
    L1_cache = L1d_cache + L1i_cache;
    }
    return L1_cache;
}

QString SystemResourceController::getCacheL2() {
    QProcess process;

    process.start("lscpu", QStringList() << "-C");
    if(!process.waitForFinished()) {
        qDebug() << "Error: " << process.errorString();
    }

    QString output = process.readAll();
    QStringList lines = output.split("\n");

    for (const QString &line : lines) {
        if (line.startsWith("L2")) {
            QStringList parts = line.split(" ",Qt::SkipEmptyParts);
            return parts[2];
        }
    }
    return "Unknow";
}

int SystemResourceController::cpuPercentage() const { return m_cpu; }

QString SystemResourceController::cpuText() const {
    return QString::number(m_cpu) + "%";
}

int SystemResourceController::ramPercentage() const { return m_ram; }

QString SystemResourceController::ramText() const {
    return QString::number(m_ram) + "%";
}

QString SystemResourceController::diskText() const {
    return "Disk usage: " + QString::number(m_disk) + "%";
}

QString SystemResourceController::networkPingText() const{
    return "Network ping: " + QString::number(m_ping) + " ms";
}
