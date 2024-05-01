import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle8
    width: 650
    height: 50
    color: "#000000"
    Rectangle {
        id: rectangle9
        x: -60
        y: -30
        width: 100
        height: 50
        color: "#000000"
        rotation: 54
    }

    Rectangle {
        id: rectangle10
        x: 610
        y: -30
        width: 100
        height: 50
        color: "#000000"
        rotation: -54
    }
    Text {
        id: text5
        color: "#ffffff"
        text: qsTr("Environmental Sound Collection and Analysis embedded application")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
    }

}

