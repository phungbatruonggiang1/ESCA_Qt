import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.6
import QtMultimedia 5.15
import "qrc:/ui/components"

Window {
    id: mainScreen
    width: 1024
    height: 600
    visible: true
    color: "#272D37"

    TopBar {
        id: topBar
        width: 650
        height: 50
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: -5
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }

    Loader {
        id: loader
        anchors.centerIn: parent
        width: 1024
        height: 500
        source: "/ui/layout/home.qml"
    }

    BottomBar {
        id: navBar
        width: 1024
        height: 50
        anchors.bottom: parent.bottom
        z:1
    }

}
