import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.6
import QtMultimedia 5.15


Rectangle {
    id: rectangle
    x: 0
    y: -1
    width: 1024
    height: 500
    color: "#272d37"

//    Item {
//        Text
//        {
//            anchors.top: parent.top
//            color: "white"
//            text: "Audio data received from C++: "
//        }
//    }

//    ChartView {
//        x: 111
//        y: 71
//        title: "Line Chart"
//        width: 800
//        height: 400
//        anchors.centerIn: parent
//        antialiasing: true

//        LineSeries {
//            id: series
//            name: "Real-time Data"
//            axisX: ValueAxis {
//                id: axisX
//                min: 1
//                max: 1028   // Giá trị tối đa hiển thị trên trục X
//                tickCount: 11
//            }
//            axisY: ValueAxis {
//                id: axisY
//                min: -105
//                max: 105
//                tickCount: 11
//            }
//        }

//        Timer {
//            interval: 1 // Mỗi 10ms cập nhật một lần // em chua biet dung nhieu cho toi uu
//            running: true
//            repeat: true
//            onTriggered: {

//                for (let i = 1028; i >= 0; i--) {
//                    var xValue = series.count; // truc x la thoi gian ( tai thoi diem chay trong for :3)
//                    var yValue = audioDataFromCpp[i];
////                  var yValue = Math.sin(xValue / 10);
//                    series.append(xValue, yValue);
//                }
//                // Cập nhật giá trị tối đa trên trục X nếu cần
//                if (xValue > axisX.max)
//                    axisX.max = xValue;
//                axisX.min = xValue - 1028;   //set lai gia tri toi da de chart chay lien tuc
//                // Cập nhật giá trị tối đa trên trục Y nếu cần
//                if (yValue > axisY.max)
//                    axisY.max = yValue;
//            }
//        }
//    }
    Rectangle {
        id: rectangle3
        x: 82
        y: 8
        width: 380
        height: 52
        color: "#69000822"
        radius: 8
        Text {
            id: text3
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
                    loader.source = "realTimeInference_data.qml"
                }
        }
    }
    Rectangle {
        id: result
        x: 541
        y: 8
        width: 414
        height: 52
        color: "#394251"
        radius: 8

        Text {
            id: text1
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
                loader.source = "realTimeInference_result.qml"
            }
        }
    }
    Rectangle {
        id: rectangle2
        x: 50
        y: 65
        width: 934
        height: 2
        color: "#ffffff"
    }
    Rectangle {
        id: rectangle4
        x: 38
        y: 82
        width: 949
        height: 400
        color: "#1b2a42"

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


