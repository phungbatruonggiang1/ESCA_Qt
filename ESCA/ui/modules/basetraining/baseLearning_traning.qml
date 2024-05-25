import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/ui/component/QtQuick/Studio/Components"
import QtQuick.Dialogs 1.0
import QtCharts 2.6
import QtMultimedia 5.15

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
        color: "#69000822"
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
        x: 38
        y: 82
        width: 949
        height: 400
        color: "#1b2a42"

    }
    Rectangle {
        id: rectangle5

        x: 798
        y: 420
        width: 179
        height: 54
        color: "#f30b0836"
        radius: 22

        Text {
            id: start_stop_Btn
            color: "#ffffff"
            text: qsTr("Execution")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 22
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
                console.log("minhgay is here");
                BaseTraining.execution("Hanoi")

            }
        }
    }
    ChartView {
        x: 111
        y: 60
        title: "Loss Training Chart"
        width: 800
        height: 360
        anchors.centerIn: parent
        antialiasing: true

        LineSeries {
            id: series
            name: "Total Loss in Base Training pharse"
            axisX: ValueAxis {
                id: axisX
                min: 1
                max: 50  // Giá trị tối đa hiển thị trên trục X
                tickCount: 30
            }
            axisY: ValueAxis {
                id: axisY
                min: 0
                max: 0.15
                tickCount: 11
            }
        }

        Timer {
            interval: 5000 // Mỗi 10ms cập nhật một lần // em chua biet dung nhieu cho toi uu
            running: true
            repeat: true
            onTriggered: {


                // var xValue = series.count;
                // var yValue = Math.sin(xValue / 10);
                // // var yValue = Math.lo

                // series.append(xValue, yValue);

                // if (xValue >= 100 && xValue % 100 == 0)
                //     axisX.max += 100;


                console.log(LossFromCpp);
                series.clear();
                for(let i = 1; i < LossFromCpp.length; i++) {
                    let xValue = i;
                    let yValue = LossFromCpp[i];
                    series.append(xValue, yValue);
                    if(xValue > axisX.max)
                        axisX.max += 20;
                }
            }
        }
    }

    Rectangle {
        id: rectangle6
        x: 38
        y: 215
        width: 52
        height: 99
        color: "#a9acc6"
        radius: 50
        Text {
            id: text4
            text: qsTr("<")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 70
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangle8
        x: 935
        y: 215
        width: 52
        height: 99
        color: "#a9acc6"
        radius: 50
        Text {
            id: text6
            text: qsTr(">")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 70
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
