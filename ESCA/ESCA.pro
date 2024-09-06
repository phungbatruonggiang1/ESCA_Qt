QT = core
QT += qml multimedia widgets network quick virtualkeyboard
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    src/common/file/accessfile.cpp \
    src/common/process/process.cpp \
    src/modules/audiomanipulation/audiomanipulation.cpp \
    src/modules/audiorecording/audioconfig.cpp \
        src/modules/audiorecording/audioconfigfile.cpp \
    src/modules/audiorecording/audiofile.cpp \
    src/modules/audiorecording/audiofilefactory.cpp \
    src/modules/audiorecording/recorddevice.cpp \
    src/modules/audiorecording/recordingchart.cpp \
        src/modules/audiorecording/recordingcontroller.cpp \
        src/modules/audiorecording/recordingschedule.cpp \
 \        # src/modules/systeminformation/basicmonitor.cpp
    src/modules/audiorecording/recordio.cpp \
    src/modules/systeminformation/systeminformationcontroller.cpp

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
    src/common/chartview.h \
    src/common/file/accessfile.h \
    src/common/process/process.h \
    src/config/config.h \
    src/modules/audiomanipulation/audiomanipulation.h \
    src/modules/audiorecording/audioconfig.h \
    src/modules/audiorecording/audioconfigfile.h \
    src/modules/audiorecording/audiofile.h \
    src/modules/audiorecording/audiofilefactory.h \
    src/modules/audiorecording/recorddevice.h \
    src/modules/audiorecording/recordingchart.h \
    src/modules/audiorecording/recordingcontroller.h \
    src/modules/audiorecording/recordingschedule.h \
 \    # src/modules/systeminformation/basicmonitor.h
    src/modules/audiorecording/recordio.h \
    src/modules/systeminformation/systeminformationcontroller.h
