// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15
// import QtQuick.Dialogs 1.0
// import Qt.labs.platform 1.0
// // Import folder list
// import Qt.labs.folderlistmodel 2.6
// // Import for play Audio
// import QtMultimedia 5.15


// Rectangle {
//     id: frame_1
//     width: 1024
//     height: 500
//     color: "transparent"

//     // tool Bar
//     Rectangle {
//         id: rectangle_55
//         x: 0
//         y: 0
//         width: 1024
//         height: 500
//         color: "#272D37"

//         Rectangle {
//             id: rectangle1
//             x: 21
//             y: 67
//             width: 983
//             height: 61
//             color: "#394251"

//             // backward feature
//             Image {
//                 id: image
//                 x: 15
//                 y: 6
//                 width: 44
//                 height: 47
//                 source: "../assets/icons8-back-50.png"
//                 fillMode: Image.PreserveAspectFit
//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                         folderListModel.folder = folderListModel.parentFolder
//                         text3.text = folderListModel.folder
//                     }
//                 }
//             }
//             // forward feature
//             Image {
//                 id: image1
//                 x: 65
//                 y: 6
//                 width: 48
//                 height: 47
//                 source: "../assets/icons8-right-50.png"
//                 fillMode: Image.PreserveAspectFit
//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                         // Use the new method to move forward in the folder hierarchy
//                         folderListModel.popFolderFromStack();
//                         text3.text = folderListModel.folder;
//                     }
//                 }
//             }

//             // choose folder feature
//             Rectangle {
//                 id: rectangle2
//                 x: 129
//                 y: 7
//                 border.color: "black"
//                 width: 326
//                 height: 46
//                 radius: 10
//                 color: "#ffffff"
//                 TextField {
//                     id: text3
//                     x: 8
//                     y: 0
//                     width: 386
//                     height: 46
//                     font.pixelSize: 22
//                     horizontalAlignment: Text.AlignLeft
//                     verticalAlignment: Text.AlignVCenter
//                     placeholderText: "Choose folder to open"
//                     maximumLength: 40
//                     background: Rectangle {
//                         border.width: 0
//                         color: "transparent"
//                     }
//                 }
//                 FolderDialog {
//                     id: folderDialog
//                     currentFolder: viewer.folder
//                     folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
//                     onAccepted: {

//                         // handle choose file
//                         text3.text = folderDialog.folder
//                         folderListModel.folder = folderDialog.folder
//                     }
//                     onRejected: {
//                         console.log("Canceled")
//                     }
//                 }
//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                         folderDialog.open();
//                     }
//                 }
//             }

//             // delete feture
//             Rectangle {
//                 id: rectangle4
//                 x: 644
//                 y: 7
//                 width: 108
//                 height: 46
//                 color: "#ffffff"
//                 radius: 10
//                 border.color: "#000000"
//                 Text {
//                     id: text5
//                     x: 21
//                     y: 11
//                     width: 54
//                     height: 27
//                     text: qsTr("Delete")
//                     font.pixelSize: 22
//                     horizontalAlignment: Text.AlignLeft
//                 }
//             }

//             // import feature
//             Rectangle {
//                 id: rectangle5
//                 x: 764
//                 y: 7
//                 width: 108
//                 height: 46
//                 color: "#ffffff"
//                 radius: 10
//                 border.color: "#000000"
//                 Text {
//                     id: text6
//                     x: 21
//                     y: 11
//                     width: 54
//                     height: 27
//                     text: qsTr("Import")
//                     font.pixelSize: 22
//                     horizontalAlignment: Text.AlignLeft
//                 }
//             }


//             // share feature
//             Rectangle {
//                 id: rectangle6
//                 x: 875
//                 y: 7
//                 width: 100
//                 height: 46
//                 color: "#ffffff"
//                 radius: 10
//                 border.color: "#000000"
//                 Text {
//                     id: text7
//                     x: 21
//                     y: 11
//                     width: 54
//                     height: 27
//                     text: qsTr("Share")
//                     font.pixelSize: 22
//                     horizontalAlignment: Text.AlignLeft
//                 }
//             }

//             // play audio feature
//             Rectangle {
//                 id: rectangle7
//                 x: 461
//                 y: 7
//                 width: 83
//                 height: 46
//                 color: "#ffffff"
//                 radius: 10
//                 border.color: "#000000"
//                 Text {
//                     id: text8
//                     x: 21
//                     y: 11
//                     width: 49
//                     height: 25
//                     text: qsTr("Play")
//                     font.pixelSize: 22
//                     horizontalAlignment: Text.AlignLeft
//                 }

//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                                     if (listView.selectedItemIndex !== -1) {
//                                         audioPlayer.source = folderListModel.get(listView.selectedItemIndex,"fileURL")
//                                         audioPlayer.play()
//                                     }
//                                 }
//                 }
//             }

//             // stop audio feature
//             Rectangle {
//                 id: rectangle3
//                 x: 550
//                 y: 7
//                 width: 83
//                 height: 46
//                 color: "#ffffff"
//                 radius: 10
//                 border.color: "black"

//                 Text {
//                     id: text4
//                     x: 21
//                     y: 11
//                     width: 49
//                     height: 25
//                     text: qsTr("Stop")
//                     font.pixelSize: 22
//                     horizontalAlignment: Text.AlignLeft
//                 }
//                 // hander stop audio feature
//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                         audioPlayer.stop()
//                     }
//                 }

//             }
//         }
//     }

//     // header
//     Rectangle {
//         id: rectangle_76
//         x: 349
//         y: 0
//         width: 326
//         height: 57
//         color: "#69000822"
//         radius: 8
//         Text {
//             x: 18
//             y: 11
//             width: 291
//             height: 29
//             color: "#ffffff"
//             text: qsTr("File manager")
//             font.pixelSize: 33
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//             wrapMode: Text.WordWrap
//             font.weight: Font.Normal
//             font.underline: false
//             font.italic: false
//             font.family: "Itim"
//             font.bold: false
//         }
//         anchors.horizontalCenter: rectLayout.horizontalCenter
//     }

//     // ListView Folder and File
//     Rectangle {
//         id: mainRect
//         x: 19
//         y: 128
//         width: 986
//         height: 318
//         // border.color: "black"
//         color: "#272d37"
//         ListView {
//             id: listView

//             // Initialization Selected Item For Hightlight
//             property int selectedItemIndex: -1

//             // property of list View
//             x: 0
//             y: 17
//             width: parent.width
//             height: parent.height
//             clip: true
//             model: FolderListModel {
//                 id: folderListModel
//                 showDirsFirst: true

//                 // If add filters then remove
//                 // nameFilters: ["*.mp3", "*.flac"]


//                 // ------------------ Hander forward feature ------------------
//                 // Add a stack property to store navigation history
//                 property var folderStack: []

//                 onFolderChanged: {
//                     // Push the current folder onto the stack when it changes
//                     folderStack.push(folder)
//                 }

//                 function popFolderFromStack() {
//                     // Pop a folder from the stack
//                     if (folderStack.length > 1) {
//                         folderStack.pop();
//                         folder = folderStack[folderStack.length - 1];
//                     }
//                 }

//                 // ------------------------- end ------------------------------
//             }

//             delegate: Rectangle {
//                 id: rectangle
//                 width: parent.width
//                 height: 66
//                 border.color: "black"

//                 Text {
//                     id: text1
//                     anchors.verticalCenter: parent.verticalCenter
//                     anchors.left: parent.left
//                     anchors.leftMargin: 20
//                     width: 158
//                     height: 22
//                     text: fileName
//                     color: "#ffffff"
//                     font.pixelSize: 20
//                 }

//                 Text {
//                     id: text2
//                     anchors.verticalCenter: parent.verticalCenter
//                     anchors.right: parent.right
//                     anchors.rightMargin: 20
//                     width: 158
//                     height: 22
//                     text: fileIsDir ? "" : (fileSize + " bytes")
//                     color: "#ffffff"
//                     font.pixelSize: 20
//                     horizontalAlignment: Text.AlignRight
//                 }

//                 // --------------------- Hander hightlight clicked item ---------------------
//                 // Thêm MouseArea để bắt sự kiện nhấp chuột
//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                         // Đặt màu nền cho item được chọn
//                         listView.selectedItemIndex = index;
//                     }
//                 }
//                 // Sử dụng biến selectedItemIndex để xác định xem item có được chọn hay không
//                 color: listView.selectedItemIndex  === index ? "#aaddff" : (fileIsDir ? "#e3e3e3" : "#272d37")
//                 // --------------------------- END --------------------------------------------
//             }
//         }
//     }

//     MediaPlayer {
//         id: audioPlayer
//         source: ""
//     }
// }


import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.0
import Qt.labs.platform 1.0
// Import folder list
import Qt.labs.folderlistmodel 2.6
// Import for play Audio
import QtMultimedia 5.15
import "qrc:/ui/component/QtQuick/Studio/Components"


Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "transparent"

    // tool Bar
    Rectangle {
        id: rectangle_55
        x: 0
        y: 0
        width: 1024
        height: 500
        color: "#272D37"

        // ListView Folder and File
        Rectangle {
            id: mainRect
            x: 21
            y: 107
            width: 986
            height: 348
            // border.color: "black"
            color: "#272d37"
            ListView {
                id: listView

                // Initialization Selected Item For Hightlight
                property int selectedItemIndex: -1

                // property of list View
                x: 0
                y: 17
                width: parent.width
                height: parent.height
                clip: true
                model: FolderListModel {
                    id: folderListModel
                    showDirsFirst: true
                    folder: "file:///home/sparc/ESCA/data"
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
                    id: rectangle
                    width: parent.width
                    height: 66
                    border.color: "black"

                    Text {
                        id: text1
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        width: 158
                        height: 22
                        text: fileName
                        color: "#ffffff"
                        font.pixelSize: 20
                    }

                    Text {
                        id: text2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        width: 158
                        height: 22
                        text: fileIsDir ? "" : ((fileSize / 1024).toFixed(2) + " KB")
                        color: "#ffffff"
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
                        }
                    }
                    // Sử dụng biến selectedItemIndex để xác định xem item có được chọn hay không
                    color: listView.selectedItemIndex  === index ? "#aaddff" : (fileIsDir ? "#e3e3e3" : "#272d37")
                    // --------------------------- END --------------------------------------------
                }
            }
        }

        Rectangle {
            id: rectangle1
            x: 21
            y: 61
            width: 986
            height: 61
            color: "#394251"

            // backward feature
            Image {
                id: image
                x: 15
                y: 6
                width: 44
                height: 47
                source: "../assets/icons8-back-50.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        folderListModel.folder = folderListModel.parentFolder
                        text3.text = folderListModel.folder
                    }
                }
            }
            // forward feature
            Image {
                id: image1
                x: 65
                y: 6
                width: 48
                height: 47
                source: "../assets/icons8-right-50.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Use the new method to move forward in the folder hierarchy
                        folderListModel.popFolderFromStack();
                        text3.text = folderListModel.folder;
                    }
                }
            }

            // choose folder feature
            Rectangle {
                id: rectangle2
                x: 129
                y: 7
                border.color: "black"
                width: 781
                height: 46
                radius: 10
                color: "#ffffff"
                TextField {
                    id: text3
                    x: 8
                    y: 0
                    width: 767
                    height: 46
                    font.pixelSize: 22
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: "Choose folder to open"
                    maximumLength: 100
                    background: Rectangle {
                        border.width: 0
                        color: "transparent"
                    }
                }
                FolderDialog {
                    id: folderDialog
                    currentFolder: viewer.folder
                    folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                    onAccepted: {

                        // handle choose file
                        text3.text = folderDialog.folder
                        folderListModel.folder = folderDialog.folder
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }

                // browser button
                Rectangle {
                    id: rectangle_82
                    x: 793
                    y: 0
                    width: 59
                    height: 46
                    color: "#ffffff"
                    radius: 8

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            folderDialog.open();
                        }
                    }
                }

            }
        }

            Rectangle {
                id: feature_rectangle
                x: 21
                y: 454
                width: 986
                height: 46
                color: "#394251"
                // delete feture
                Rectangle {
                    id: rectangle4
                    x: 867
                    width: 108
                    height: 30
                    color: "#ffffff"
                    radius: 10
                    border.color: "#000000"
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: text5
                        text: qsTr("Delete")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                // import feature
                Rectangle {
                    id: rectangle5
                    x: 125
                    width: 99
                    height: 30
                    color: "#ffffff"
                    radius: 10
                    border.color: "#000000"
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: text6
                        text: qsTr("Import")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }


                // share feature
                Rectangle {
                    id: rectangle6
                    x: 253
                    width: 100
                    height: 30
                    color: "#ffffff"
                    radius: 10
                    border.color: "#000000"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 0
                    Text {
                        id: text7
                        text: qsTr("Share")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                // play audio feature
                Rectangle {
                    id: rectangle7
                    x: 660
                    width: 83
                    height: 30
                    color: "#ffffff"
                    radius: 10
                    border.color: "#000000"
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: text8
                        text: qsTr("Play")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                                        if (listView.selectedItemIndex !== -1) {
                                            audioPlayer.source = folderListModel.get(listView.selectedItemIndex,"fileURL")
                                            audioPlayer.play()
                                        }
                        }
                    }
                }

                // stop audio feature
                Rectangle {
                    id: rectangle3
                    x: 765
                    width: 83
                    height: 30
                    color: "#ffffff"
                    radius: 10
                    border.color: "black"
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        id: text4
                        text: qsTr("Stop")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    // hander stop audio feature
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            audioPlayer.stop()
                        }
                    }

                }
                // sync feature
                Rectangle {
                    id: rectangle8
                    x: 17
                    width: 84
                    height: 30
                    color: "#ffffff"
                    radius: 10
                    border.color: "#000000"
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: text9
                        text: qsTr("Export")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                                                    if (listView.selectedItemIndex !== -1) {
                                                        audioPlayer.source = folderListModel.get(listView.selectedItemIndex,"fileURL")
                                                        audioPlayer.play()
                                                    }
                                                }
                    }
                }
            }

    }

    // header
    Rectangle {
        id: rectangle_76
        x: 349
        y: 8
        width: 326
        height: 47
        color: "#69000822"
        radius: 8
        Text {
            color: "#ffffff"
            text: qsTr("File manager")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Normal
            font.underline: false
            font.italic: false
            font.family: "Itim"
            font.bold: false
        }
        anchors.horizontalCenter: rectLayout.horizontalCenter
    }

    MediaPlayer {
        id: audioPlayer
        source: ""
    }
}
