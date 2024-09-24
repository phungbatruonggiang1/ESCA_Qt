import QtQuick 2.15
import "../component"
import QtQuick.Controls 2.15


Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "transparent"

    Rectangle {
        id: rectangle_55
        x: 0
        y: 0
        width: 1024
        height: 500
        color: "#272D37"
    }

    Image {
        id: rectangle_57
        x: 18
        y: 209
        source: "assets/rectangle_57.svg"
    }

    Text {
        id: select_folder_to_store
        x: 24
        y: 175
        width: 361
        height: 24
        color: "#ffffff"
        text: qsTr("Select the base model to use")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }


    Image {
        id: rectangle_58
        x: 18
        y: 290
        source: "assets/rectangle_58.svg"
    }


    Rectangle {
        id: rectangle_83
        x: 800
        y: 218
        width: 131
        height: 36
        color: "#6935416c"
        radius: 8
    }

    Text {
        id: set_time_to_start_record
        x: 25
        y: 306
        width: 321
        height: 24
        color: "#ffffff"
        text: qsTr("Model name to output")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }

    Rectangle {
        id: rectangle
        x: 730
        y: 405
        width: 243
        height: 54
        color: "#f30b0836"
        radius: 22

        Text {
            id: start_stop_Btn
            x: 0
            y: 0
            width: 250
            height: 48
            color: "#ffffff"
            text: qsTr("Execution")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.WaitCursor
            onClicked: {
                loader.source = "/ui/layout/splitingScreen.qml"
            }
        }
    }

    Text {
        id: browser
        width: 120
        height: 23
        color: "#ffffff"
        text: qsTr("Browser")
        font.pixelSize: 26
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Light
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 347
        anchors.verticalCenterOffset: -14
        font.family: "Josefin Sans"
    }

    Rectangle {
        id: rectangle_82
        x: 943
        y: 218
        width: 45
        height: 36
        color: "#6935416c"
        radius: 8
    }



    Rectangle {
        id: rectangle_76
        x: 349
        y: 26
        width: 326
        height: 71
        color: "#69000822"
        radius: 8
        Text {
            x: 18
            y: 21
            width: 291
            height: 29
            color: "#ffffff"
            text: qsTr("Transfer Learning")
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.weight: Font.Normal
            font.underline: false
            font.italic: false
            font.family: "Itim"
            font.bold: false
        }
        anchors.horizontalCenter: rectLayout.horizontalCenter
    }

    TextInput {
        id: textInput2
        x: 24
        y: 218
        width: 565
        height: 30
        color: "#ffffff"
        text: qsTr("home/nguyen-lam-nghia")
        font.pixelSize: 22
        font.italic: true
    }
    ComboBox {
        id: comboBox
        x: 791
        y: 297
        width: 197
        height: 37
        background: Rectangle {
            color:"#6935416c"
            border.width: parent && parent.activeFocus ? 2 : 1
            border.color: parent && parent.activeFocus ? comboBoxCustom.palette.highlight : comboBoxCustom.palette.button
        }
        model: ListModel {
                ListElement { text: "Module 1"}
                ListElement { text: "Module 2"}
                ListElement { text: "Module 3"}
        }
    }
}

