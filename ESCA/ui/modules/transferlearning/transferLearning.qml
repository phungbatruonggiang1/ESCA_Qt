import QtQuick 2.15
import "qrc:/ui/component/QtQuick/Studio/Components"
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

    SvgPathItem {
        id: line_21_Stroke_
        x: 23
        // y: 96
        y: 100
        width: 975
        height: 1
        strokeColor: "transparent"
        strokeStyle: 1
        joinStyle: 0
        antialiasing: true
        strokeWidth: 1
        fillColor: "#ffffff"
        path: "M 975 1 L 0 1 L 0 0 L 975 0 L 975 1 Z"
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

    SvgPathItem {
        id: vector
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 953
        strokeColor: "transparent"
        anchors.bottomMargin: 253
        strokeStyle: 1
        joinStyle: 0
        anchors.rightMargin: 44
        antialiasing: true
        strokeWidth: 1
        fillColor: "#ffffff"
        anchors.topMargin: 224
        path: "M 0 3.2857142857142856 C 0 1.4734375391687664 1.5134766027331352 0 3.375 0 L 10.341211259365082 0 C 11.34843784198165 0 12.3134765625 0.39017849309103825 13.025390625 1.0832588502338953 L 15.287694990634918 3.2857142857142856 L 23.625 3.2857142857142856 C 25.486523397266865 3.2857142857142856 27 4.759151824883052 27 6.571428571428571 L 27 19.714285714285715 C 27 21.526562460831233 25.486523397266865 23 23.625 23 L 3.375 23 C 1.5134766027331352 23 0 21.526562460831233 0 19.714285714285715 L 0 3.2857142857142856 Z M 3.375 2.4642857142857144 C 2.910937489941716 2.4642857142857144 2.53125 2.83392856163638 2.53125 3.2857142857142856 L 2.53125 19.714285714285715 C 2.53125 20.16607143836362 2.910937489941716 20.535714285714285 3.375 20.535714285714285 L 23.625 20.535714285714285 C 24.089062510058284 20.535714285714285 24.46875 20.16607143836362 24.46875 19.714285714285715 L 24.46875 6.571428571428571 C 24.46875 6.119642847350665 24.089062510058284 5.75 23.625 5.75 L 15.113672196865082 5.75 C 14.554687801748514 5.75 14.016796231269836 5.5343751566750665 13.621288418769836 5.149330513817923 L 11.237695634365082 2.823660714285714 C 11.000390946865082 2.5926339285714284 10.678711264394224 2.4642857142857144 10.341211259365082 2.4642857142857144 L 3.375 2.4642857142857144 Z"
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

