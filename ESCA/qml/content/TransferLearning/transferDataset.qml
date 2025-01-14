import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Rectangle {
    width: 800
    height: 500
    color: "#2a2a2a"

    property int fileNum: 0

    Column {
        anchors.centerIn: parent
        width: 750
        height: 400
        spacing: 30

        Text {
            text: "Dataset Configuration"
            font.pointSize: 24
            font.bold: true
            font.family: "Oxanium"
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        GridLayout {
            columns: 3
            columnSpacing: 40
            rowSpacing: 25
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Base Weight Path:"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignRight
            }
            TextField {
                id: baseWeightPath
                placeholderText: "./Results/tl-training_results/Target2/saved_model/vq_vae"
                text: "./Results/tl-training_results/Target2/saved_model/vq_vae"
                width: 600
                height: 35
                font.family: "Oxanium"
                readOnly: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                //                elide: Text.ElideNone
            }

            Rectangle {
                id: rectangle
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        folderDialog1.open();
                    }
                }
            }

            Label {
                text: "TFRecord Path (Used):"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignRight
            }
            TextField {
                id: tfrecordUsedPath
                placeholderText: "./park_dataset_demo/target/Target3"
                text: "./park_dataset_demo/target/Target3"
                width: 600
                height: 35
                font.family: "Oxanium"
                readOnly: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                //                elide: Text.ElideNone
            }

            Rectangle {
                id: rectangle1
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {
                        folderDialog2.open();
                    }
                }
            }

            Label {
                text: "TFRecord Path (New):"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignRight
            }
            TextField {
                id: tfrecordNewPath
                placeholderText: "Path to new TFRecord dataset"
                width: 600
                height: 35
                font.family: "Oxanium"
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                //                elide: Text.ElideNone
            }

            Rectangle {
                id: rectangle2
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: {
                        folderDialog3.open();
                    }
                }
            }

            Label {
                text: "Save Path:"
                font.pointSize: 13
                color: "#ffffff"
                font.family: "Oxanium"
                Layout.alignment: Qt.AlignRight
            }
            TextField {
                id: savePath
                text: TransferConfig.savePath
                width: 600
                height: 35
                font.family: "Oxanium"
                readOnly: true
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 13
                clip: true
                onTextChanged: {
                    TransferConfig.savePath = savePath.text
                }
            }

            Rectangle {
                id: rectangle3
                width: 35
                height: 35
                color: "#ffffff"

                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: {
                        folderDialog4.open();
                    }
                }
            }

        }

        FileDialog {
            id: folderDialog1
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                baseWeightPath.text = folderDialog1.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog1.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }
        FileDialog {
            id: folderDialog2
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                tfrecordUsedPath.text = folderDialog2.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog2.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }
        FileDialog {
            id: folderDialog3
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                tfrecordNewPath.text = folderDialog3.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog3.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }
        FileDialog {
            id: folderDialog4
            title: "Choose a folder"
            selectFolder: true // This is the key to select folders instead of files
            selectExisting: true // Make sure we select an existing one
            nameFilters: ["*"] // Display all folders
            onAccepted: {
                savePath.text = folderDialog4.fileUrl // Update the text with the folder URL
                console.log("Selected folder: " + folderDialog4.fileUrl)
            }
            onRejected: {
                console.log("Folder1 selection cancelled")
            }
        }

        Button {
            text: "Save Configuration"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 45
            font.pointSize: 16
            font.family: "Oxanium"
            background: Rectangle {
                color: "#0055ff"
                radius: 10
            }
            onClicked: {
                console.log("Base Weight Path:", baseWeightPath.text)
                console.log("TFRecord Path (Used):", tfrecordUsedPath.text)
                console.log("TFRecord Path (New):", tfrecordNewPath.text)
                console.log("Save Path:", savePath.text)
                // Add logic to save these paths to a JSON file
                TransferConfig.saveConfig("/home/haiminh/config.json");
            }
        }
    }
}
