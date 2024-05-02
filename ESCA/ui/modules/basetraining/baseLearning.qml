import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/ui/component/QtQuick/Studio/Components"
import QtQuick.Dialogs 1.0


Rectangle {
            property bool connected: false
    Rectangle {
        id: frame_27
        width: 1024
        height: 500
        color: "#262e4b"
        property alias model_name_to_outputText: model_name_to_output.text
        property alias select_folder_to_storedText: select_folder_to_stored.text
        property alias executionText: execution.text


        Rectangle {
            id: rectangle
            x: 33
            y: 132
            width: 380
            height: 64
            color: "#061d33"
            border.color: "#e0a3339a"
        }

        Image {
            id: image_render
            x: 451
            y: 97
            fillMode: Image.PreserveAspectCrop
            source: "/ui/assets/defaultLearningImg.png"    // default img

            Connections {
                target: DisplayResult

                function onSetLossImage(imageName) {
                    // console.log("Hi Giang")
                    console.log(imageName);
                    image_render.source ="file://" + imageName;
                }
            }
        }

        Rectangle {
            id: rectangle_73
            x: 75
            y: 407
            width: 211
            height: 54
            color: "#6935416c"
            radius: 8

            Text {
                id: execution
                width: 154
                height: 35
                color: "#ffffff"
                text: connected ? qsTr("Stop") : qsTr("Execution")
                font.pixelSize: 26
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.weight: Font.Bold
                anchors.centerIn: parent
                font.family: "Josefin Sans"
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onClicked: {
                    connected = !connected;
                    DisplayResult.selectResult('Hanoi');

//                    if (connected) {
//                        fileWatcher.connect(onSetImage);
//                        console.log("Connection established");
//                    } else {
//                        fileWatcher.disconnect(onSetImage);
//                        console.log("Connection closed");
//                    }
                }
            }
        }

        Text {
            id: select_folder_to_stored
            x: 48
            y: 101
            width: 365
            height: 24
            color: "#ffffff"
            text: qsTr("Select folder to stored")
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Itim"
        }

        TextInput {
            id: folder_save_file
            width: 272
            height: 24
            color: "#ffffff"
            text: qsTr("home/data_after_training")
            font.pixelSize: 22
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            font.weight: Font.Light
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -88
            anchors.horizontalCenterOffset: -329
            font.family: "Josefin Sans"
        }



        SvgPathItem {
            id: line_21_Stroke_
            x: 47
            y: 73
            width: 951
            height: 1
            fillColor: "#ffffff"
            path: "M 951 1 L 0 1 L 0 0 L 951 0 L 951 1 Z"
            antialiasing: true
            strokeColor: "transparent"
            joinStyle: 0
            strokeStyle: 1
            strokeWidth: 1
        }

        Rectangle {
            id: rectangle_76
            x: 399
            y: 12
            width: 246
            height: 52
            color: "#69000822"
            radius: 8

            Text {
                id: base_learning_text
                x: 21
                y: 8
                color: "#ffffff"
                text: qsTr("Base Training")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: false
                font.pointSize: 24
            }
        }

        Text {
            id: model_name_to_output
            x: 47
            y: 227
            width: 298
            height: 23
            color: "#ffffff"
            text: qsTr("Model name to output")
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Itim"
        }

        Rectangle {
            id: rectangle_81
            x: 355
            y: 148
            width: 44
            height: 36
            color: "#6935416c"
            radius: 8

            FileDialog {
                id: choose_folder_save_file
                title: "Please choose a file"
                onAccepted: {
                    console.log("You choose: " + choose_file_save_record.fileUrl)
                    // handle choose file
                    folder_to_store.text = "" + choose_file_save_record.folder;
                }
                onRejected: {
                    console.log("Canceled")
                    //                Qt.quit()
                }
            }

            MouseArea {
                id: mouseArea1
                anchors.fill: parent
                onClicked: {
                    choose_folder_save_file.open();
                }
            }
        }

        SvgPathItem {
            id: vector
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            fillColor: "#ffffff"
            anchors.leftMargin: 367
            path: "M 0 2.2857142857142856 C 0 1.0250000272478375 1.1771484687924385 0 2.625 0 L 8.043164312839508 0 C 8.826562765985727 0 9.5771484375 0.27142851693289616 10.130859375 0.7535713740757533 L 11.890429437160492 2.2857142857142856 L 18.375 2.2857142857142856 C 19.82285153120756 2.2857142857142856 21 3.310714312962123 21 4.571428571428571 L 21 13.714285714285714 C 21 14.974999972752162 19.82285153120756 16 18.375 16 L 2.625 16 C 1.1771484687924385 16 0 14.974999972752162 0 13.714285714285714 L 0 2.2857142857142856 Z M 2.625 1.7142857142857142 C 2.2640624921768904 1.7142857142857142 1.96875 1.9714285646166119 1.96875 2.2857142857142856 L 1.96875 13.714285714285714 C 1.96875 14.028571435383387 2.2640624921768904 14.285714285714285 2.625 14.285714285714285 L 18.375 14.285714285714285 C 18.73593750782311 14.285714285714285 19.03125 14.028571435383387 19.03125 13.714285714285714 L 19.03125 4.571428571428571 C 19.03125 4.257142850330897 18.73593750782311 4 18.375 4 L 11.755078375339508 4 C 11.320312734693289 4 10.901952624320984 3.8500001089913503 10.594335436820984 3.5821429661342075 L 8.740429937839508 1.9642857142857142 C 8.555859625339508 1.8035714285714284 8.305664316751063 1.7142857142857142 8.043164312839508 1.7142857142857142 L 2.625 1.7142857142857142 Z"
            antialiasing: true
            anchors.bottomMargin: 326
            strokeColor: "transparent"
            anchors.rightMargin: 637
            joinStyle: 0
            strokeStyle: 1
            anchors.topMargin: 158
            strokeWidth: 1
        }

        ComboBox {
            id: comboBox
            x: 33
            y: 262
            width: 380
            height: 64
            model: ["Model 1", "Model 2", "Model 3"]

            // Customizing the appearance of items in the ComboBox
            delegate: Item {
                width: comboBox.width
                height: 30

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "lightblue" // Background color
                    border.color: "#e0a3339a"

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        color: "white" // Set the text color
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            comboBox.currentIndex = index
                        }
                    }
                }
            }

            //            Signal handler for item selection change
            onCurrentIndexChanged: {
                var selectedItem = model[currentIndex] // Get the selected item
                console.log("Selected Item:", selectedItem)
                // Add logic here
            }
        }
    }
}
