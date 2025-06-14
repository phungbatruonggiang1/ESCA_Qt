/* @@@LICENSE
 *
 * Copyright (c) 2020-2025 SPARC Laboratory, HUST.
 * Copyright (c) 2023-2025 Phung Ba Truong Giang.
 *
 * LICENSE@@@ */

import QtQuick 2.15

Rectangle {
    width: 1024
    height: 50
    color: "#000000"
    anchors.top: parent.top

    Text {
        id: text1
        color: "#FFFFFF"
        text: qsTr("Environmental Sound Collection and Analysis embedded application")
        anchors.fill: parent
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Josefin Sans"
        font.bold: true
    }
}
