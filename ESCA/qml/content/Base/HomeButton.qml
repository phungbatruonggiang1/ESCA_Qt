import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: bottomBarRec
    width: 1024
    height: 50
    color: "#000000"
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0

    Image {
        id: logoImg
        y: -84
        width: 172
        height: 162
        source: "/qml/content/resources/backgrounds/logoHome.png"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectCrop
        z : 1

        MouseArea {
            id: maLogo
            anchors.fill: parent
            cursorShape: Qt.WaitCursor
            onClicked: {
                console.log("minh dai ca o main")
                screenLoader.source = "../Base/FullScreen.qml"
            }
        }
    }
}