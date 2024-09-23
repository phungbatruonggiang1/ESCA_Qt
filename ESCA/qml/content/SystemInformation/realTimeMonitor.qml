import QtQuick 2.15
import QtQuick.Controls 2.15

import "../component"

Rectangle {
    width: 800
    height: 440
    color: "#272d37"

    // graph
    CpuFrame{
        x: 277
        y: 95
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
        x: 542
        y: 164
        width: 250
        height: 250
        anchors.right: parent.right
        anchors.rightMargin: 8
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    loader.source = "ramMonitor.qml"
                }
        }
    }

    GpuFrame{
        y: 164
        width: 250
        height: 250
        anchors.left: parent.left
        anchors.leftMargin: 21
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
        x: 21
        y: 8
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
        x: 21
        y: 54
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
        x: 532
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
        x: 532
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
