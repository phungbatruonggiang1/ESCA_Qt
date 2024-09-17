import QtQuick 2.15
import QtQuick.Controls 2.15

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
