import QtQuick 2.12
import "qrc:/ui/components/QtQuick/Studio/Components"
import QtQuick.Controls 2.12

Rectangle {
    id: frame_22
    width: 1024
    height: 500
    color: "#141619"

    Item {
        id: imgBackground
        x: 0
        y: 0
        width: 1024
        height: 500
        opacity: 0.5
        Image {
            id: rectangle
            source: "/ui/assets/Gravity Forces Blue Icon Game Presentation(10).svg"
            anchors.centerIn: parent
        }
    }

    Text {
        id: recording_audio_text
        width: 140
        height: 29
        color: "#ffffff"
        text: qsTr("Recording Audio")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -33
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -366
    }

    Text {
        id: base_learning_text
        width: 140
        height: 28
        color: "#ffffff"
        text: qsTr("Base Training")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 191
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -364
    }

    Text {
        id: tranfer_learning_text
        width: 140
        height: 28
        color: "#ffffff"
        text: qsTr("Tranfer Learning")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 191
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -113
    }

    Text {
        id: realtime_inference_text
        width: 156
        height: 27
        color: "#ffffff"
        text: qsTr("Real-time inference")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 192
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 134
    }

    Text {
        id: system_config_text
        width: 156
        height: 28
        color: "#ffffff"
        text: qsTr("Recording Configure")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: 191
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 384
    }

    Text {
        id: process_file_text
        width: 170
        height: 29
        color: "#ffffff"
        text: qsTr("Audio Manipulation")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -33
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -113
    }

    Text {
        id: file_manager_text
        width: 140
        height: 29
        color: "#ffffff"
        text: qsTr("File Manager")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -30
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 133
    }

    Text {
        id: system_performance_text
        width: 175
        height: 29
        color: "#ffffff"
        text: qsTr("System Performance")
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.verticalCenterOffset: -33
        font.weight: Font.Medium
        font.family: "Josefin Sans"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 391
    }

    Rectangle {
        id: base_learning_rec
        width: 145
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -367

        Image {
            id: baseLearningIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/ui/assets/microchip-solid.svg"
        }
        MouseArea {
            id: base_learning_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                loader.source = "/ui/layout/loss_curve_display.qml"
            }
        }
    }

    Rectangle {
        id: transfer_learning_rec
        width: 144
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -116

        Image {
            id: transferIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/ui/assets/shuffle-solid.svg"
        }

        MouseArea {
            id: tranfer_learning_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                loader.source = "/ui/layout/transferLearning_data.qml"
            }
        }
    }

    Rectangle {
        id: realtime_inference_rec
        width: 144
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 133

        Image {
            id: resultsData
            anchors.centerIn: parent
            width: 40
            height: 50
            smooth: true
            source: "/ui/assets/lightbulb-regular.svg"
        }

        MouseArea {
            id: realtime_inference_ma
            anchors.fill: parent
            anchors.rightMargin: 0
            onClicked: {
                console.log("minh dai ca")
                loader.source = "/ui/layout/realTimeInference_data.qml"
            }
        }
    }

    Rectangle {
        id: system_config_rec
        width: 145
        height: 137
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: 94
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 384

        Image {
            id: systemConfigIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true // khử răng cưa
            fillMode: Image.PreserveAspectFit
            source: "/ui/assets/gear-solid.svg"
        }

        MouseArea {
            id: system_config_ma
            anchors.fill: parent
            onClicked: {
                loader.source = "/ui/modules/recording/systemConfig.qml"
            }
        }
    }

    Rectangle {
        id: recording_audio_rec
        width: 145
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -367

        Image {
            id: recordIcon
            anchors.centerIn: parent
            width: 40
            height: 50
            smooth: false // khử răng cưa
            fillMode: Image.PreserveAspectFit
            source: "/ui/assets/microphone-solid.svg"
        }

        MouseArea {
            id: recording_audio_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                loader.source = "/ui/modules/recording/recordingSound.qml"
            }
        }
    }

    Rectangle {
        id: process_file_rec
        width: 144
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -116

        Image {
            id: processDataIcon
            anchors.centerIn: parent
            width: 60
            height: 45
            smooth: false
            fillMode: Image.PreserveAspectFit
            source: "/ui/assets/laptop-file-solid.svg"
        }

        MouseArea {
            id: process_file_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                loader.source = "/ui/modules/audiomanipulation/processData.qml"
            }
        }
    }

    Rectangle {
        id: file_manager_rec
        width: 144
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 133

        Image {
            id: fileManagerIcon
            anchors.centerIn: parent
            width: 60
            height: 50
            smooth: true
            source: "/ui/assets/folder-open-regular.svg"
        }

        MouseArea {
            id: file_manager_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                loader.source = "/ui/layout/fileManager.qml"
            }
        }
    }

    Rectangle {
        id: system_performance_rec
        width: 145
        height: 139
        color: "#fdd33b"
        radius: 10
        anchors.verticalCenterOffset: -131
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 384

        Image {
            id: systemPerformanceIcon
            anchors.centerIn: parent
            width: 50
            height: 50
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "/ui/assets/chart-line-solid.svg"
        }

        MouseArea {
            id: system_performance_ma
            anchors.fill: parent
            anchors.leftMargin: 0
            onClicked: {
                loader.source = "/ui/layout/about.qml"
            }
        }
    }

}
