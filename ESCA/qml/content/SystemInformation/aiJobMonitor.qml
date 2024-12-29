import QtQuick 2.15
import QtQuick.Controls 2.15
import "../component"
// Import folder list
// import Qt.labs.folderlistmodel 2.6

Rectangle {
    width: 800
    height: 440
    color: "#2a2a2a"

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
            x: 8
            y: -40
            width: parent.width
            height: parent.height
            clip: true
            // model: FolderListModel {
            //     id: folderListModel
            //     showDirsFirst: true
            //     folder: "home/haiminh/Desktop/ESCA/result/monitor"

            //     // If add filters then remove
            //     // nameFilters: ["*.mp3", "*.flac"]


            //     // ------------------ Hander forward feature ------------------
            //     // Add a stack property to store navigation history
            //     property var folderStack: []

            //     onFolderChanged: {
            //         // Push the current folder onto the stack when it changes
            //         folderStack.push(folder)
            //     }

            //     function popFolderFromStack() {
            //         // Pop a folder from the stack
            //         if (folderStack.length > 1) {
            //             folderStack.pop();
            //             folder = folderStack[folderStack.length - 1];
            //         }
            //     }

            //     // ------------------------- end ------------------------------
            // }

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
                        let source = folderListModel.folder + '/' + fileName;
                        console.log(source);
                        DisplayResult.selectMonitorResult(source);
                    }
                }
                // Sử dụng biến selectedItemIndex để xác định xem item có được chọn hay không
                color: listView.selectedItemIndex  === index ? "#aaddff" : (fileIsDir ? "#e3e3e3" : "#394251")
                // --------------------------- END --------------------------------------------
            }
        }
    }

    // Image render
    Image {
        id: image
        x: 509
        y: 39
        width: 419
        height: 362
        source: "../images/defaultLearningImg.png"
        fillMode: Image.PreserveAspectFit
        Connections {
            target: DisplayResult

            function onSetMonitorImage(imageName) {
                // console.log("Hi Giang")
                console.log(imageName);
                image.source =imageName;
            }
        }
    }
    Rectangle {
        id: rectangle4
        x: 39
        y: 14
        width: 211
        height: 43
        color: "#69000822"
        radius: 8
        border.color: "#ffffff"
        border.width: 2
        Text {
            id: text4
            color: "#ffffff"
            text: qsTr("Base Training")
            anchors.fill: parent
            font.pixelSize: 23
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                rectangle5.border.color = "#000000"
                rectangle5.border.width = 1
                rectangle4.border.width = 2
                rectangle4.border.color = "#ffffff"
                folderListModel.folder = "file:///home/sparc/ESCA/result/monitor"
            }
        }
    }
    Rectangle {
        id: rectangle5
        x: 256
        y: 14
        width: 211
        height: 43
        color: "#69000822"
        radius: 8
        border.color: "#000000"
        border.width: 1
        Text {
            id: text5
            color: "#ffffff"
            text: qsTr("Transfer Learning")
            anchors.fill: parent
            font.pixelSize: 23
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                rectangle4.border.color = "#000000"
                rectangle4.border.width = 1
                rectangle5.border.width = 2
                rectangle5.border.color = "#ffffff"
                folderListModel.folder = "file:///home/haiminh/Desktop/ESCA/result/transferlearning"
            }
        }
    }
}
