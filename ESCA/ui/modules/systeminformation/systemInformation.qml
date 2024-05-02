import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/ui/component"

Rectangle {
    width: 1024
    height: 500
    color: "#272d37"

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
        color: "#69000822"
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
        color: "#394251"
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
        x: 41
        y: 66
        width: 943
        height: 2
        color: "#ffffff"
    }
    // End header

    // TEMP COMPONENT

    Text {
        id: diskUsage
        x: 57
        y: 322
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
        x: 57
        y: 389
        width: 440
        height: 40
        color: "#ffffff"
        text: "Display: 7 inch QLED quantum Dot display"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }
    Text {
        id: runnningTime
        x: 529
        y: 322
        width: 429
        height: 40
        color: "#ffffff"
        text: "Input source: Micro Sennheiser MKE 600"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: connectionPort
        x: 529
        y: 389
        width: 429
        height: 40
        color: "#ffffff"
        text: "Output source: No Information"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Roboto"
        font.weight: Font.Normal
    }

    Text {
        id: internetStatus1
        x: 50
        y: 90
        width: 663
        height: 40
        color: "#ffffff"
        text: "CPU: Quad-core ARM Cortex-A57 MPCore processor"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Text {
        id: internetStatus2
        x: 50
        y: 153
        width: 663
        height: 40
        color: "#ffffff"
        text: "GPU: NVIDIA Maxwell architecture with 128 NVIDIA CUDA® cores\t"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Text {
        id: internetStatus3
        x: 50
        y: 214
        width: 663
        height: 40
        color: "#ffffff"
        text: "Memory: External Storage: SSD Kingston 256GB"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Rectangle {
        id: rectangle4
        x: 45
        y: 294
        width: 934
        height: 3
        color: "#ffffff"
    }

    Text {
        id: internetStatus4
        x: 829
        y: 90
        width: 83
        height: 40
        color: "#ffffff"
        text: "Caches"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Rectangle {
        id: rectangle5
        x: 743
        y: 66
        width: 3
        height: 231
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle6
        x: 41
        y: 66
        width: 3
        height: 378
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle7
        x: 981
        y: 66
        width: 3
        height: 378
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle8
        x: 41
        y: 442
        width: 943
        height: 2
        color: "#ffffff"
    }

    Text {
        id: internetStatus5
        x: 777
        y: 153
        width: 140
        height: 40
        color: "#ffffff"
        text: "L1:      32 KB"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }

    Text {
        id: internetStatus6
        x: 777
        y: 214
        width: 140
        height: 40
        color: "#ffffff"
        text: "L2:      2 MB"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Roboto"
    }
}
