import QtQuick 2.15
import QtQuick.Controls 2.15
import SystemResource 1.0
import "../component"

Rectangle {
    width: 800
    height: 440
    color: "#272d37"
    SystemResourceController {
        id: backendObject
    }
    // graph
    CpuFrame{
        x: 387
        y: 80
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
        y: 117
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
        y: 117
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

    // TEMP COMPONENT

    Text {
        id: diskUsage
        x: 64
        y: 8
        width: 272
        height: 40
        color: "#ffffff"
        text: backendObject.diskText
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
        y: 48
        width: 260
        height: 40
        color: "#ffffff"
        text: backendObject.networkPingText
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Button {
        x: 288
        width: 68
        height: 28
        text: qsTr("Update")
        anchors.verticalCenter: internetStatus.verticalCenter
        font.family: "Roboto"
        onClicked: {
            backendObject.updateNetworkPing()
        }
    }

    Text {
        id: runnningTime
        x: 700
        y: 8
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
        x: 700
        y: 48
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
