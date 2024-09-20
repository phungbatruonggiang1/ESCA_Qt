import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/ui/component/QtQuick/Studio/Components"
import QtQuick.Dialogs 1.0
// import Qt.labs.platform 1.0


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
    // HEADER
    Rectangle {
        id: about
        x: 41
        y: 8
        width: 147
        height: 52
        color: "#69000822"
        radius: 8

        Text {
            id: text_about
            color: "#ffffff"
            text: qsTr("Data")
            anchors.fill: parent
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "baseLearning_data.qml"
            }

        }
    }

    Rectangle {
        id: rectangle3
        x: 207
        y: 8
        width: 388
        height: 52
        color: "#394251"
        radius: 8
        Text {
            id: text3
            color: "#ffffff"
            text: qsTr("Parameters Configure")
            anchors.fill: parent
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "baseLearning_parameterConfigure.qml"
            }
        }
    }
    Rectangle {
        id: rectangle
        x: 615
        y: 8
        width: 195
        height: 52
        color: "#394251"
        radius: 8

        Text {
            id: text1
            color: "#ffffff"
            text: qsTr("Training")
            anchors.fill: parent
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "baseLearning_traning.qml"
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 827
        y: 8
        width: 157
        height: 52
        color: "#394251"
        radius: 8
        Text {
            id: text2
            color: "#ffffff"
            text: qsTr("Result")
            anchors.fill: parent
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.source = "baseLearning_result.qml"
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

    Text {
        id: select_folder_to_store
        x: 46
        y: 138
        width: 312
        height: 24
        color: "#ffffff"
        text: qsTr("Select folder to store")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }

    Text {
        id: set_time_to_start_record
        x: 41
        y: 330
        width: 321
        height: 24
        color: "#ffffff"
        text: qsTr("Time to split")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }

    Rectangle {
        id: rectangle_64
        x: 804
        y: 317
        width: 166
        height: 37
        color: "#6935416c"
        radius: 8

        TextInput {
            id: textInput
            color: "#ffffff"
            width: 99
            height: 30
            text: qsTr("10 minutes")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


    Rectangle {

        x: 766
        y: 412
        width: 216
        height: 52
        color: "#f30b0836"
        radius: 22

        Text {
            id: start_stop_Btn
            x: 24
            y: -10
            width: 168
            height: 68
            color: "#ffffff"
            text: qsTr("Execution")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 22
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.WaitCursor
            onClicked: {
                console.log("minh is here");
            }
        }
    }

    Text {
        id: select_folder_to_store1
        x: 43
        y: 231
        width: 422
        height: 24
        color: "#ffffff"
        text: qsTr("Select folder to store file after split")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }
    TextInput {
        id: textInput1
        x: 46
        y: 270
        width: 565
        height: 30
        color: "#ffffff"
        text: qsTr("/home/opt")
        font.pixelSize: 20
        font.italic: true
    }

    Rectangle {
        id: open_file_rec
        x: 800
        y: 225
        width: 170
        height: 36
        color: "#6935416c"
        radius: 8
        Text {
            color: "#ffffff"
            text: qsTr("Browser")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 22
            wrapMode: Text.Wrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Light
            font.family: "Josefin Sans"
        }
        FileDialog {
            id: folderDialog3
            folder: "/home"
            selectFolder: true
            title: "Please choose a file"

            onAccepted: {

                console.log("You choose: " + folderDialog3.folder)

                // handle choose file
                textInput1.text = folderDialog3.folder
            }
            onRejected: {
                console.log("Canceled")
                //                Qt.quit()
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                folderDialog3.open()
            }
        }
    }
    TextInput {
        id: textInput2
        x: 46
        y: 177
        width: 565
        height: 30
        color: "#ffffff"
        text: qsTr("/home/usr")
        font.pixelSize: 20
        font.italic: true
    }

    Rectangle {
        id: rectangle_85
        x: 802
        y: 138
        width: 170
        height: 36
        color: "#6935416c"
        radius: 8
        Text {
            id: browser2
            color: "#ffffff"
            text: qsTr("Browser")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 22
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Josefin Sans"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        FileDialog {
            id: folderDialog2
            folder: "/home"
            selectFolder: true
            title: "Please choose a file"

            onAccepted: {

                console.log("You choose: " + folderDialog2.folder)

                // handle choose file
                textInput2.text = folderDialog2.folder
            }
            onRejected: {
                console.log("Canceled")
                //                Qt.quit()
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                folderDialog2.open()
            }
        }
    }
}
