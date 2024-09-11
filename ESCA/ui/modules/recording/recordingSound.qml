import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
import QtMultimedia 5.15
import AudioChartImport 1.0

Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#262e4b"

    property bool flag: false
    property var audioData: []

    Component.onCompleted: {

        flag = RecordingObject.recStatus;
        console.log("hello")
        // chartData = RecordingObject.audioChart;
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
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -214
        anchors.verticalCenterOffset: -65
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

    Canvas {
        id: audioWaveform
        width: 800
        height: 400
        x: 200
        y: 50

        property int maxAmplitude: 32769 // Assuming 16-bit PCM -> 32768 da chuan hoa ve 1

        onPaint: {
            console.log("start paint");
            // console.log("qml data:", AudioChart.audioSeries[0]);

            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Draw grid
            ctx.strokeStyle = "#444";
            ctx.lineWidth = 1;
            for (var i = 0; i < width; i += width / 10) {
                ctx.beginPath();
                ctx.moveTo(i, 0);
                ctx.lineTo(i, height);
                ctx.stroke();
            }
            for (var j = 0; j < height; j += height / 10) {
                ctx.beginPath();
                ctx.moveTo(0, j);
                ctx.lineTo(width, j);
                ctx.stroke();
            }

            // Draw waveform
            ctx.strokeStyle = "#00ff00";
            ctx.lineWidth = 2;
            ctx.beginPath();
            for (var k = 0; k < audioData.length; k++) {
                var x = k * width / audioData.length;
                var y = height / 2 - (audioData[k] / maxAmplitude) * height / 2;
                if (k === 0) {
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }
            }
            ctx.stroke();
        }
    }

    Connections {
        target: AudioChart
        function onAudioSeriesChanged() {
            audioData = AudioChart.audioSeries;
            audioWaveform.requestPaint();
            console.log("qml data:", AudioChart.audioSeries[0]);
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

                else {
                    RecordingObject.stopRecording();
                    // console.log("hello", RecordingObject.getBufferChart);
                }
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

}
