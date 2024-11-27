import QtQuick 2.15
import QtQuick.Controls 2.15
import "../component"
// Import folder list
import Qt.labs.folderlistmodel 2.6


Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#2a2a2a"

    property string chooseFile: ""

    // BACKGOUND
    Rectangle {
        id: rectangle_55
        x: 0
        y: 0
        width: 1024
        height: 500
        color: "#2a2a2a"
    }

    // HEADER
    Rectangle {
        id: rectangle_76
        x: 369
        y: 14
        width: 287
        height: 60
        color: "#69000822"
        radius: 8
        Text {
            color: "#ffffff"
            text: qsTr("Process Data")
            anchors.fill: parent
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.underline: false
            font.italic: false
            font.bold: false
            font.weight: Font.Normal
            font.family: "Itim"
        }
    }
    // filemanager


    Rectangle {
        id: mainRect
        x: 25
        y: 110
        width: 448
        height: 323
//        border.color: "black"
        color: "#272d37"
        ListView {
            id: listView
            // Initialization Selected Item For Hightlight
            property int selectedItemIndex: -1

            // property of list View
            x: 0
            y: 42
            width: parent.width
            height: parent.height
            clip: true
            model: FolderListModel {
                id: folderListModel
                folder: "file:///home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2"
                showDirsFirst: true

                // If add filters then remove
                // nameFilters: ["*.mp3", "*.flac"]


                // ------------------ Hander forward feature ------------------
                // Add a stack property to store navigation history
                property var folderStack: []

                onFolderChanged: {
                    // Push the current folder onto the stack when it changes
                    folderStack.push(folder)
                }

                function popFolderFromStack() {
                    // Pop a folder from the stack
                    if (folderStack.length > 1) {
                        folderStack.pop();
                        folder = folderStack[folderStack.length - 1];
                    }
                }

                // ------------------------- end ------------------------------
            }

            delegate: Rectangle {
                width: parent.width
                height: 66
                border.color: "black"
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    width: 158
                    height: 22
                    color: "#ffffff"
                    text: fileName
                    font.pixelSize: 20
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    width: 158
                    height: 22
                    color: "#ffffff"
                    text: fileIsDir ? "" : ((fileSize / 1024).toFixed(2) + " KB")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignRight
                }

                // --------------------- Hander hightlight clicked item ---------------------
                // Thêm MouseArea để bắt sự kiện nhấp chuột
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Đặt màu nền cho item được chọn
                        listView.selectedItemIndex = index;
                        chooseFile = fileName;

                    }
                }
                // Sử dụng biến selectedItemIndex để xác định xem item có được chọn hay không
                color: listView.selectedItemIndex  === index ? "#aaddff" : (fileIsDir ? "#e3e3e3" : "#394251")
                // --------------------------- END --------------------------------------------
            }
        }
    }

    // menu
    Rectangle {
        id: rectangle5
        x: 96
        y: 101
        width: 306
        height: 43
        color: "#69000822"
        radius: 8
        Text {
            id: text5
            color: "#ffffff"
            text: qsTr("Select files to process")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    // ruler
    Rectangle {
        id: rectangle
        x: 514
        y: 101
        width: 2
        height: 373
        color: "#ffffff"
    }

    //Select processing feature
    Rectangle {
        id: rectangle6
        x: 627
        y: 101
        width: 306
        height: 43
        color: "#69000822"
        radius: 8
        Text {
            id: text6
            color: "#ffffff"
            text: qsTr("Select processing feature")
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: rectangle7
        x: 540
        y: 178
        width: 150
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text7
            color: "#ffffff"
            text: qsTr("Frequencies")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                AudioManipulationObject.extractFrequency(chooseFile);
            }
        }
    }

    Rectangle {
        id: rectangle8
        x: 699
        y: 178
        width: 155
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text8
            color: "#ffffff"
            text: qsTr("Spectrograms")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: rectangle9
        x: 863
        y: 178
        width: 150
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text9
            color: "#ffffff"
            text: qsTr("Filter banks")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }
    }

    Rectangle {
        id: rectangle10
        x: 540
        y: 250
        width: 473
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text10
            color: "#ffffff"
            text: qsTr("Gammatone Frequency Cepstral Coefﬁcients")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                AudioManipulationObject.extractGFCC(chooseFile);
            }
        }
    }

    Rectangle {
        id: rectangle11
        x: 540
        y: 327
        width: 473
        height: 63
        color: "#394251"
        radius: 8
        Text {
            id: text11
            color: "#ffffff"
            text: qsTr("Mel-Frequency Cepstral Coefﬁcients")
            anchors.fill: parent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            cursorShape: Qt.WaitCursor
            onClicked: {
                AudioManipulationObject.extractMFCC(chooseFile);
            }
        }
    }
}


