import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle4
    width: 1024
    height: 460
    color: "#272d37"
    property string selectedTab: "systemInformation"

    // HEADER
    Rectangle {
        id: about
        x: 50
        y: 8
        width: 113
        height: 52
        color: selectedTab == "about" ? "#69000822" : "#394251"
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
                selectedTab = "about"
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
        color: selectedTab == "systemInformation" ? "#69000822" : "#394251"
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
                selectedTab = "systemInformation"
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
        color: selectedTab == "realTimeMonitor" ? "#69000822" : "#394251"
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
                selectedTab = "realTimeMonitor"
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
        color: selectedTab == "aiJobMonitor" ? "#69000822" : "#394251"
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
                selectedTab = "aiJobMonitor"
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

    Rectangle {
        id: contentRec
        x: 19
        y: 68
        width: 1000
        height: 420
        color: "#272d37"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        anchors.topMargin: 68

        Loader {
            id: loader
            anchors.fill: parent
            source: "systemInformation.qml"
        }
    }

}
