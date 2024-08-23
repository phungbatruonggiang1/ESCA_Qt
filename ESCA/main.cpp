#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtWidgets/QApplication>
#include <QDebug>

#include "./src/modules/audiorecording/recordingcontroller.h"
#include "./src/modules/audiomanipulation/audiomanipulation.h"
#include "./src/modules/audiorecording/recordingchart.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/ui/main.qml"));
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

    RecordingController* recordingController = new RecordingController();

    // control audiocontroller
    engine.rootContext()->setContextProperty("RecordingObject", recordingController);

    // Should be use the qmlRegisterType<MyQMLType> or slots in C++ because it just calls function from QML to C++
    // and it's enssetially a backend of the QML
    AudioManipulation audioManipulation;
    engine.rootContext()->setContextProperty("AudioManipulationObject", &audioManipulation);

    return app.exec();
}
