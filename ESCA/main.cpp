#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtWidgets/QApplication>

#include "./src/modules/audiorecording/recordingcontroller.h"
#include "./src/modules/audiorecording/recordingchart.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    RecordingController recordingController;

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/ui/main.qml"));

    qmlRegisterType<RecordingChart>("MinhRecChart", 1, 0, "MinhChart");
    engine.rootContext()->setContextProperty("RecordingObject", &recordingController);

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

    // engine.rootContext()->setContextProperty("RecChart", recordingChart);

    return app.exec();
}
