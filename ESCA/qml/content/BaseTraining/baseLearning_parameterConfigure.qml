import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/ui/component/QtQuick/Studio/Components"
import QtQuick.Dialogs 1.0

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
        color: "#394251"
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
        color: "#69000822"
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

    Rectangle {
        id: rectangle4
        x: 18
        y: 74
        width: 983
        height: 247
        color: "#242731"
        radius: 10
        Text {
            x: 18
            y: 14
            width: 183
            height: 26
            color: "#ffffff"
            text: qsTr("Configure PATH")
            font.pixelSize: 22
            font.family: "Itim"
        }
        Rectangle {
            x: 9
            y: 53
            width: 966
            height: 42
            color: "#2e3d55"
            radius: 10
            Text {
                x: 27
                color: "#ffffff"
                text: qsTr("TFRECORDS")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                anchors.verticalCenterOffset: 1
                font.family: "Itim"
            }
            TextInput {
                x: 199
                width: 759
                height: 28
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                maximumLength: 100
                anchors.verticalCenterOffset: -1
            }
            Rectangle {
                x: 181
                y: 0
                width: 2
                height: 42
                color: "#ffffff"
            }
        }

        Rectangle {
            x: 9
            y: 101
            width: 966
            height: 42
            color: "#2e3d55"
            radius: 10
            Text {
                x: 27
                color: "#ffffff"
                text: qsTr("NORMAL")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                anchors.verticalCenterOffset: 1
                font.family: "Itim"
            }
            TextInput {
                x: 199
                width: 759
                height: 28
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                maximumLength: 100
                anchors.verticalCenterOffset: -1
            }
            Rectangle {
                x: 181
                y: 0
                width: 2
                height: 42
                color: "#ffffff"
            }
        }
        Rectangle {
            x: 9
            y: 149
            width: 966
            height: 42
            color: "#2e3d55"
            radius: 10
            Text {
                x: 27
                color: "#ffffff"
                text: qsTr("ANOMALY")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                anchors.verticalCenterOffset: 1
                font.family: "Itim"
            }
            TextInput {
                x: 199
                width: 759
                height: 28
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                maximumLength: 100
                anchors.verticalCenterOffset: -1
            }
            Rectangle {
                x: 181
                y: 0
                width: 2
                height: 42
                color: "#ffffff"
            }
        }
        Rectangle {
            x: 9
            y: 197
            width: 966
            height: 42
            color: "#2e3d55"
            radius: 10
            Text {
                x: 27
                color: "#ffffff"
                text: qsTr("TEST")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                anchors.verticalCenterOffset: 1
                font.family: "Itim"
            }
            TextInput {
                x: 199
                width: 759
                height: 28
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                maximumLength: 100
                anchors.verticalCenterOffset: -1
            }
            Rectangle {
                x: 181
                y: 0
                width: 2
                height: 42
                color: "#ffffff"
            }
        }

        Image {
            id: rectangle_57
            x: 18
            y: 209
            source: "assets/rectangle_57.svg"
        }
    }

    Rectangle {
        x: 18
        y: 327
        width: 983
        height: 147
        color: "#242731"
        radius: 10
        Text {
            x: 18
            y: 14
            width: 228
            height: 26
            color: "#ffffff"
            text: qsTr("Configure TRAINING")
            font.pixelSize: 22
            font.family: "Itim"
        }
        Rectangle {
            x: 9
            y: 43
            width: 966
            height: 42
            color: "#2e3d55"
            radius: 10
            Text {
                x: 27
                color: "#ffffff"
                text: qsTr("SAVE_PATH")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.family: "Itim"
                anchors.verticalCenterOffset: 1
            }

            TextInput {
                x: 199
                width: 759
                height: 28
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                maximumLength: 100
                anchors.verticalCenterOffset: -1
            }

            Rectangle {
                x: 181
                y: 0
                width: 2
                height: 42
                color: "#ffffff"
            }
        }

        Rectangle {
            x: 9
            y: 91
            width: 966
            height: 42
            color: "#2e3d55"
            radius: 10
            Text {
                x: 27
                color: "#ffffff"
                text: qsTr("EPOCH")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.family: "Itim"
                anchors.verticalCenterOffset: 1
            }

            TextInput {
                x: 199
                width: 759
                height: 28
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                maximumLength: 100
                anchors.verticalCenterOffset: -1
            }

            Rectangle {
                x: 181
                y: 0
                width: 2
                height: 42
                color: "#ffffff"
            }
        }
    }
}
