QT = core
QT += quick
QT += qml
QT += multimedia
QT += widgets
QT += network
QT += quick virtualkeyboard

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        src/components/dynamicchart/dynamicchart.cpp \
        src/modules/audiorecording/audioconfigfile.cpp \
        src/modules/audiorecording/audioengine.cpp \
        src/modules/audiorecording/recordingchart.cpp \
        src/modules/audiorecording/recordingcontroller.cpp \
        src/modules/audiorecording/recordingschedule.cpp \
        src/modules/systeminformation/basicmonitor.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/components/dynamicchart/dynamicchart.h \
    src/modules/audiorecording/audioconfigfile.h \
    src/modules/audiorecording/audioengine.h \
    src/modules/audiorecording/recordingchart.h \
    src/modules/audiorecording/recordingcontroller.h \
    src/modules/audiorecording/recordingschedule.h \
    src/modules/systeminformation/basicmonitor.h
