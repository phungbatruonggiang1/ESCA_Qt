import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/ui/component"

Rectangle {
    width: parent
    height: parent
    color: "#272d37"

    // graph
    CpuFrame{
        x: 387
        y: 125
        width: 250
        height: 250
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "cpuMonitor.qml"
                }
        }
    }

    RamFrame{
        y: 187
        width: 250
        height: 250
        anchors.right: parent.right
        anchors.rightMargin: 47
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "ramMonitor.qml"
                }
        }
    }
    GpuFrame{
        y: 187
        width: 250
        height: 250
        anchors.left: parent.left
        anchors.leftMargin: 50
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "gpuMonitor.qml"
                }
        }
    }

    // HEADER
    Rectangle {
        id: about
        x: 50
        y: 8
        width: 113
        height: 52
        color: "#394251"
        radius: 8

        Text {
            id: text_about
            color: "#ffffff"
            text: qsTr("About")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "about.qml"
                }
        }
    }

    Rectangle {
        id: rectangle3
        x: 169
        y: 8
        width: 291
        height: 52
        color: "#394251"
        radius: 8
        Text {
            id: text3
            color: "#ffffff"
            text: qsTr("System Infomation")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "systemInformation.qml"
                }
        }
    }
    Rectangle {
        id: rectangle
        x: 466
        y: 8
        width: 285
        height: 52
        color: "#69000822"
        radius: 8

        Text {
            id: text1
            color: "#ffffff"
            text: qsTr("Real-time monitor")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "realTimeMonitor.qml"
                }
        }
    }

    Rectangle {
        id: rectangle1
        x: 757
        y: 8
        width: 227
        height: 52
        color: "#394251"
        radius: 8
        Text {
            id: text2
            color: "#ffffff"
            text: qsTr("AI job monitor")
            anchors.fill: parent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "aiJobMonitor.qml"
            }
        }
    }
    Rectangle {
        id: rectangle2
        x: 50
        y: 65
        width: 934
        height: 2
        color: "#ffffff"
    }
    // End header


    // TEMP COMPONENT

    Text {
        id: diskUsage
        x: 64
        y: 80
        width: 272
        height: 40
        color: "#ffffff"
        text: BackendObject.diskText
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: internetStatus
        x: 64
        y: 126
        width: 260
        height: 40
        color: "#ffffff"
        text: "Monitor: ASUS VA27EHF"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }
    Text {
        id: runnningTime
        x: 679
        y: 80
        width: 260
        height: 40
        color: "#ffffff"
        text: "Microphone: AT2020"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: connectionPort
        x: 679
        y: 120
        width: 260
        height: 40
        color: "#ffffff"
        text: "Speaker: MEGUO 2023"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }
}
