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

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    RecordingController recordingController;
    SystemInformationController systemInformationController;

    // AudioConfig audioConfig;
    QQmlApplicationEngine engine;

    engine.addImportPath("qrc:/qml/imports"); // Thêm phần QML vô C++
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    engine.rootContext()->setContextProperty("RecordingObject", &recordingController);
    engine.rootContext()->setContextProperty("BackendObject", &systemInformationController);

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


