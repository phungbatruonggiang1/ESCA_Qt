#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtWidgets/QApplication>
#include <QDebug>

#include "./src/modules/audiorecording/recordingcontroller.h"
#include "./src/modules/audiomanipulation/audiomanipulation.h"
#include "./src/modules/audiorecording/recordingchart.h"
#include "./src/modules/audiorecording/audioconfig.h"
#include "./src/modules/systeminformation/systeminformationcontroller.h"
#include "./src/modules/filemanager/FileIO.h"
#include "./src/modules/aiprocess/aicontroller.h"
#include "./src/modules/aiprocess/configurationmanager.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QCoreApplication::setOrganizationName("HUST-SIST-SPARC");
    QCoreApplication::setOrganizationDomain("sparc.com");
    QCoreApplication::setApplicationName("ESCA");

    RecordingController recordingController;
    SystemInformationController systemInformationController;
    AIController aiController;

    // AudioConfig audioConfig;
    QQmlApplicationEngine engine;

    // Khởi tạo ConfigurationManager và tải cấu hình
    ConfigurationManager configManager;
    configManager.loadConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json");

    engine.addImportPath("qrc:/qml/imports"); // Thêm phần QML vô C++
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    engine.rootContext()->setContextProperty("RecordingObject", &recordingController);
    engine.rootContext()->setContextProperty("BackendObject", &systemInformationController);
    engine.rootContext()->setContextProperty("AIObject", &aiController);

    engine.rootContext()->setContextProperty("ConfigManager", &configManager);

    qmlRegisterType<FileIO>("FileIO", 1, 0, "FileIO");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    // Should be use the qmlRegisterType<MyQMLType> or slots in C++ because it just calls function from QML to C++
    // and it's enssetially a backend of the QML
    AudioManipulation audioManipulation;
    engine.rootContext()->setContextProperty("AudioManipulationObject", &audioManipulation);

    return app.exec();
}


