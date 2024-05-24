import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/ui/components/QtQuick/Studio/Components"
// Import folder list
import Qt.labs.folderlistmodel 2.6

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
        color: "#69000822"
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
            text: qsTr("AI tasks monitor")
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

    Image {
        id: image1
        x: 142
        y: 119
        width: 248
        height: 103
        source: "../assets/si-synergy-logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        x: 444
        y: 104
        width: 137
        height: 135
        source: "../assets/hust-logo.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image3
        x: 385
        y: 42
        width: 712
        height: 257
        source: "../assets/sparc-lab-logo.png"
        fillMode: Image.PreserveAspectFit


    }

    Text {
        id: text4
        x: 237
        y: 287
        color: "#ffffff"
        text: qsTr("Environmental Sound Collection and Analysis embedded applications")
        font.pixelSize: 18
    }
    Text {
        id: text5
        x: 270
        y: 328
        color: "#ffffff"
        text: qsTr("HUST Industry-Academia Collaboration Project")
        font.pixelSize: 23
    }

    Text {
        id: text6
        x: 834
        y: 401
        color: "#ffffff"
        text: qsTr("© Copyright by ESCA3 2023")
        font.pixelSize: 12
    }
    // End header


}
