import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.0
// import Qt.labs.platform 1.0

Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#000000"

    property bool aiStatus: AIObject.isRunning

    Rectangle {
        id: rectangle
        x: 20
        y: 373
        width: 985
        height: 128
        color: "#2a2a2a"
        radius: 20

        Text {
            id: select_folder_to_store2
            x: 23
            y: 17
            width: 160
            height: 36
            color: "#ffffff"
            text: qsTr("Data Source ")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Oxanium"
            font.weight: Font.Normal
        }

        TextInput {
            id: dataSourceInTx
            x: 175
            y: 23
            width: 223
            height: 30
            color: "#ffffff"
            text: qsTr("/home/data")
            font.pixelSize: 22
            font.family: "Oxanium"
            font.italic: true
        }

        Rectangle {
            id: rectangle_87
            x: 404
            y: 15
            width: 127
            height: 41
            color: "#6935416c"
            radius: 8
            Text {
                color: "#ffffff"
                text: qsTr("Browser")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 22
                wrapMode: Text.Wrap
                font.family: "Oxanium"
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
            }

            FileDialog {
                id: folderDialog2
                folder: "/home"
                onAccepted: {

                    console.log("You choose: " + folderDialog2.folder)

                    // handle choose file
                    dataSourceInTx.text = folderDialog2.folder

                }
                onRejected: {
                    console.log("Canceled")
                    //                Qt.quit()
                }
                title: "Please choose a file"
                selectFolder: true
            }

            MouseArea {
                anchors.fill: parent
                anchors.centerIn: parent
                onClicked: {
                    folderDialog2.open()
                }
            }
        }

        Text {
            id: select_folder_to_store
            x: 23
            y: 82
            width: 197
            height: 36
            color: "#ffffff"
            text: qsTr("Inference Model")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Oxanium"
            font.weight: Font.Normal
        }

        TextInput {
            id: textInput2
            x: 218
            y: 87
            width: 215
            height: 30
            color: "#ffffff"
            text: qsTr("/bin/python3")
            font.pixelSize: 22
            font.family: "Oxanium"
            font.italic: true
        }

        Rectangle {
            id: rectangle_85
            x: 429
            y: 74
            width: 127
            height: 41
            color: "#6935416c"
            radius: 8
            Text {
                color: "#ffffff"
                text: qsTr("Browser")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 22
                wrapMode: Text.Wrap
                font.family: "Oxanium"
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
            }

            FileDialog {
                id: folderDialog3
                folder: "/home"
                onAccepted: {

                    console.log("You choose: " + folderDialog2.folder)

                    // handle choose file
                    textInput2.text = folderDialog3.folder

                }
                onRejected: {
                    console.log("Canceled")
                    //                Qt.quit()
                }
                title: "Please choose a file"
                selectFolder: true
            }

            MouseArea {
                anchors.fill: parent
                anchors.centerIn: parent
                onClicked: {
                    folderDialog3.open()
                }
            }
        }

        Button {
            id: button
            x: 622
            y: 12
            width: 114
            height: 46
            text: qsTr("Data")
        }

        Button {
            id: button1
            x: 622
            y: 71
            width: 114
            height: 46
            text: qsTr("Show Result")
        }

        Button {
            id: button2
            x: 791
            y: 27
            width: 137
            height: 74
            text: qsTr("Start")

            onClicked: {
                if (!aiStatus) {
                    AIObject.startAIProcess();
                }
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 20
        y: 0
        width: 985
        height: 354
        color: "#2a2a2a"
        radius: 20

        Text {
            id: minhtestTx
            x: 333
            y: 62
            width: 96
            height: 42
            text: AIObject.inferenceResult
            font.pixelSize: 24
            font.family: "Oxanium"
        }
    }
}
