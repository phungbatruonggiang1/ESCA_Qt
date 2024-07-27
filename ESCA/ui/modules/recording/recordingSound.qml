import QtQuick 2.15
import "qrc:/ui/components/QtQuick/Studio/Components"
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
import QtCharts 2.6
import QtMultimedia 5.15

Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#262e4b"

    property bool flag: false
    property string device_name: ''
    property string duration: 'duration'
    property string file_to_store: 'file_to_store'
    property var inputSources: []
    property var outputSources: []

    Component.onCompleted: {

        inputSources = RecordingObject.getInputAudioDeviceList();
        // console.log("hello"+inputSources);
        console.log(RecordingObject.getBufferChart);
        outputSources = RecordingObject.getOutputAudioDeviceList();
        listInputDeviceModel.append({"name" : "none"});
        listOutputDeviceModel.append({"name" : "none"});
        for (let i = 0; i < inputSources.length; ++i) {
            listInputDeviceModel.append({"name" : inputSources[i]});
        }

        for (let j=0; j<outputSources.length; ++j) {
            listOutputDeviceModel.append({"name" : outputSources[j]});
        }
    }

    Text {
        id: select_folder_to_store
        x: 23
        y: 120
        width: 290
        height: 24
        color: "#ffffff"
        text: qsTr("Folder stored audio file")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }

    Text {
        id: choose_file_text
        width: 545
        height: 70
        color: "#ffffff"
        text: "file_to_store"
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Light
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -214
        anchors.verticalCenterOffset: -65
        font.family: "Josefin Sans"
    }

    SvgPathItem {
        id: line_21_Stroke_
        x: 25
        y: 91
        width: 975
        height: 1
        strokeColor: "transparent"
        strokeStyle: 1
        joinStyle: 0
        antialiasing: true
        strokeWidth: 1
        fillColor: "#ffffff"
        path: "M 975 1 L 0 1 L 0 0 L 975 0 L 975 1 Z"
    }

    Rectangle {
        id: rectangle_74
        x: 423
        y: 11
        width: 249
        height: 67
        color: "#69000822"
        radius: 8

        Text {
            id: text1
            x: 14
            y: 17
            width: 222
            height: 29
            color: "#ffffff"
            text: qsTr("Recording Sound")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.weight: Font.Normal
            font.family: "Itim"
        }
    }

    Text {
        id: set_time_to_start_record
        x: 24
        y: 241
        width: 212
        height: 24
        color: "#ffffff"
        text: qsTr("Duration")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Itim"
    }

    ComboBox {
        id: choose_input_device
        x: 300
        y: 100
        width: 195
        height: 35
        font.pointSize: 13
        currentIndex: 0

        model: ListModel {
            id: listInputDeviceModel
        }

        onCurrentIndexChanged: {
            let selectedItem = inputSources[currentIndex] // Get the selected item
            RecodingObject.setInputAudioDevice(selectedItem);
            // Add logic here
        }
    }

    ComboBox {
        id: choose_output_device
        x: 300
        y: 300
        width: 195
        height: 35
        font.pointSize: 13
        currentIndex: 0

        model: ListModel {
            id: listOutputDeviceModel
        }

        onCurrentIndexChanged: {
            var selectedItem = outputSources[currentIndex] // Get the selected item
            RecodingObject.setOutputAudioDevice(selectedItem);
            // Add logic here
        }
    }
    // ListView {
    //     x: 580
    //     y: 100
    //     width: 180
    //     height: 300

    //     // Data
    //     model: ListModel {
    //         id: listModel
    //     }

    //     // One element css
    //     delegate: Item {
    //         width: parent.width
    //         height: 50
    //         Row {
    //             spacing: 5
    //             Text {
    //                 text: name
    //                 font.pixelSize: 20
    //                 color: "#FFFFFF"
    //             }
    //         }
    //     }
    // }
    ChartView {
        id: lineChart
        title: "Line Chart"
        x:500
        y:100
        width: 500
        height: 360


        LineSeries {
            id: series
            name: "Real-time Data"
            axisX: ValueAxis {
                id: axisX
                min: 1
                max: 1028 // Giá trị tối đa hiển thị trên trục X
                tickCount: 11
            }
            axisY: ValueAxis {
                id: axisY
                min: -105
                max: 105
                tickCount: 11
            }
        }

        Timer {
            interval: 100 // Mỗi 10ms cập nhật một lần // em chua biet dung nhieu cho toi uu
            running: flag
            repeat: true
            onTriggered: {

                for (var i = 1028; i >= 0; i--) {
                    var xValue = series.count
                    // truc x la thoi gian ( tai thoi diem chay trong for :3)
                    // var yValue = RecordingObject.getBufferChart()[i];
                    var yValue = Math.sin(xValue / 10);
                    if (yValue >= 95 || yValue <= -95) {
                        // console.log("yValue: " + yValue)
                    }
                    series.append(xValue, yValue)

                }
                // Cập nhật giá trị tối đa trên trục X nếu cần
                if (xValue > axisX.max)
                    axisX.max = xValue
                    axisX.min = xValue - 1028 //set lai gia tri toi da de chart chay lien tuc
                // Cập nhật giá trị tối đa trên trục Y nếu cần
                if (yValue > axisY.max)
                    axisY.max = yValue
            }
        }
    }

    Rectangle {
        id: start_stop_rec
        x: 251
        y: 412
        width: 176
        height: 58
        color: "#f30b0836"
        radius: 22

        Text {
            id: start_stop_text
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            color: "#ffffff"
            text: flag ? "Stop" : "Start"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 22
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                flag = !flag;
                if(flag)
                    RecordingObject.startRecording();
                else
                    RecordingObject.stopRecording();
            }
        }
    }

    Text {
        id: device_label
        x: 23
        y: 365
        width: 174
        height: 24
        color: "#ffffff"
        text: qsTr("Device name")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    Text {
        id: device_name_text
        width: 225
        height: 26
        color: "#ffffff"
        text: "device_name"
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors.centerIn: parent
        font.family: "Josefin Sans"
        anchors.horizontalCenterOffset: -191
        font.weight: Font.Light
        anchors.verticalCenterOffset: 128
    }

    Rectangle {
        id: file_manager_rec
        x: 16
        y: 412
        width: 212
        height: 58
        color: "#f30b0836"
        radius: 22

        Text {
            id: file_manager_text
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            color: "#ffffff"
            text: "File Manager"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 22
        }

        MouseArea {
            id: file_manager_ma
            anchors.fill: parent
            onClicked: {
                loader.source = "/ui/layout/fileManager.qml"
            }
        }
    }

    Text {
        id: device_name_text1
        x: 4
        y: 4
        width: 189
        height: 26
        color: "#ffffff"
        text: "duration"
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors.verticalCenterOffset: 43
        anchors.centerIn: parent
        font.weight: Font.Light
        anchors.horizontalCenterOffset: -398
        font.family: "Josefin Sans"
    }

    Text {
        id: device_name_text2
        x: 4
        y: 4
        width: 19
        height: 26
        color: "#ffffff"
        text: ""
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors.verticalCenterOffset: 43
        anchors.centerIn: parent
        font.weight: Font.Light
        anchors.horizontalCenterOffset: -288
        font.family: "Josefin Sans"
    }

    Text {
        id: device_name_text3
        x: 7
        y: 7
        width: 189
        height: 26
        color: "#ffffff"
        text: ""
        font.pixelSize: 23
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors.verticalCenterOffset: 43
        anchors.centerIn: parent
        font.weight: Font.Light
        anchors.horizontalCenterOffset: -179
        font.family: "Josefin Sans"
    }
}
