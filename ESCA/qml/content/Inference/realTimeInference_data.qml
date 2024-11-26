import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.0
//import AudioChartImport 1.0
// import Qt.labs.platform 1.0

Rectangle {
    id: frame_1
    width: 1024
    height: 500
    color: "#000000"

    property bool recStatus: RecordingObject.recStatus
    property bool aiStatus: AIObject.isRunning

    property var predValue: []  // Variable to store audio data
    property double threshold: 0.0026  // Set the threshold value

    Rectangle {
        id: rectangle
        x: 20
        y: 373
        width: 985
        height: 128
        color: "#2a2a2a"
        radius: 20

        Text {
            id: select_folder_to_store2
            x: 23
            y: 17
            width: 160
            height: 36
            color: "#ffffff"
            text: qsTr("Data Source ")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Oxanium"
            font.weight: Font.Normal
        }

        TextInput {
            id: dataSourceInTx
            x: 175
            y: 23
            width: 223
            height: 30
            color: "#ffffff"
            text: qsTr("/home/haiminh/data")
            font.pixelSize: 22
            font.family: "Oxanium"
            font.italic: true
        }

        Rectangle {
            id: rectangle_87
            x: 404
            y: 15
            width: 127
            height: 41
            color: "#6935416c"
            radius: 8
            Text {
                color: "#ffffff"
                text: qsTr("Browser")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 22
                wrapMode: Text.Wrap
                font.family: "Oxanium"
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
            }

            FileDialog {
                id: folderDialog2
                folder: "/home"
                onAccepted: {

                    console.log("You choose: " + folderDialog2.folder)
                    // handle choose file
                    dataSourceInTx.text = folderDialog2.folder

                }
                onRejected: {
                    console.log("Canceled")
                    //                Qt.quit()
                }
                title: "Please choose a file"
                selectFolder: true
            }

            MouseArea {
                anchors.fill: parent
                anchors.centerIn: parent
                onClicked: {
                    folderDialog2.open()
                }
            }
        }

        Text {
            id: select_folder_to_store
            x: 23
            y: 82
            width: 197
            height: 36
            color: "#ffffff"
            text: qsTr("Inference Model")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Oxanium"
            font.weight: Font.Normal
        }

        TextInput {
            id: textInput2
            x: 218
            y: 87
            width: 215
            height: 30
            color: "#ffffff"
            text: qsTr("/bin/rt_test")
            font.pixelSize: 22
            font.family: "Oxanium"
            font.italic: true
        }

        Rectangle {
            id: rectangle_85
            x: 429
            y: 74
            width: 127
            height: 41
            color: "#6935416c"
            radius: 8
            Text {
                color: "#ffffff"
                text: qsTr("Browser")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 22
                wrapMode: Text.Wrap
                font.family: "Oxanium"
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Light
            }

            FileDialog {
                id: folderDialog3
                folder: "/home"
                onAccepted: {

                    console.log("You choose: " + folderDialog2.folder)

                    // handle choose file
                    textInput2.text = folderDialog3.folder

                }
                onRejected: {
                    console.log("Canceled")
                    //                Qt.quit()
                }
                title: "Please choose a file"
                selectFolder: true
            }

            MouseArea {
                anchors.fill: parent
                anchors.centerIn: parent
                onClicked: {
                    folderDialog3.open()
                }
            }
        }

        Button {
            id: button
            x: 622
            y: 12
            width: 114
            height: 46
            text: qsTr("Data")

            onClicked: {
                predValue = AIObject.predValue;
                minhtestTx.text = predValue.toString
            }
        }

        Button {
            id: button1
            x: 622
            y: 71
            width: 114
            height: 46
            text: qsTr("Config")

            onClicked: {
                screenLoader.source = "./realTimeInference_result.qml"
            }
        }

        Button {
            id: startBtn
            x: 799
            y: 12
            width: 137
            height: 46
            text: qsTr("Start")

            onClicked: {
                if (!recStatus) {
                    RecordingObject.startRecording()
                }

                if (!aiStatus) {
                    AIObject.start();
                }
            }
        }

        Button {
            id: stopBtn
            x: 799
            y: 71
            width: 137
            height: 46
            text: qsTr("Stop")

            onClicked: {
                AIObject.stop();
                RecordingObject.stopRecording()
            }
        }
    }

    Rectangle {
        id: chartRec
        x: 20
        y: 0
        width: 985
        height: 350
        color: "#2a2a2a"
        radius: 20

        Text {
            id: minhtestTx
            x: 312
            y: 8
            width: 361
            height: 37
            color: "#ffffff"
            text: "" + AIObject.predValue[0]
            font.pixelSize: 24
            font.family: "Oxanium"
        }

        Canvas {
            id: predChart
            anchors.fill: parent

            // Dữ liệu giả lập và Timer để cập nhật real-time
            property int threshold: 50 // Giá trị threshold (mặc định là 50)

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                // Chart layout settings
                var margin = 50;
                var chartWidth = predChart.width - margin * 2;
                var chartHeight = predChart.height - margin * 2;

                // Draw Y-axis grid and labels
                var yAxisValues = [0.01, 0.009, 0.008, 0.007, 0.006, 0.005, 0.004, 0.003, 0.002, 0.001, 0];

                var yAxisStep = chartHeight / (yAxisValues.length - 1);

                ctx.font = "13px Oxanium";
                ctx.strokeStyle = "#5A5A5A";
                ctx.lineWidth = 0.5;

                for (var i = 0; i < yAxisValues.length; i++) {
                    var y = margin + i * yAxisStep;
                    ctx.fillStyle = "white";
                    ctx.fillText(yAxisValues[i], 10, y + 5); // Labels for Y-axis
                    ctx.beginPath();
                    ctx.moveTo(margin, y);
                    ctx.lineTo(predChart.width - margin, y);
                    ctx.stroke();
                }

                // Draw X-axis labels and grid lines
                ctx.font = "13px Oxanium";
                var xAxisLogPositions = [0, 0.25, 0.5, 0.75, 1];
                var xMin = margin;
                var xMax = predChart.width - margin;
                var xStep = (xMax - xMin) / (xAxisLogPositions.length - 1);

                for (i = 0; i < xAxisLogPositions.length; i++) {
                    var x = xMin + i * xStep;
                    ctx.fillStyle = "white";
                    ctx.fillText((xAxisLogPositions[i] * predValue.length).toFixed(0), x - 10, predChart.height - 10); // Labels for X-axis
                    ctx.beginPath();
                    ctx.moveTo(x, margin);
                    ctx.lineTo(x, predChart.height - margin);
                    ctx.stroke();
                }

                // Set the threshold line properties
                var thresholdY = 200;  // Y-coordinate of the threshold line
                ctx.strokeStyle = "#ff0000";  // Line color
                ctx.lineWidth = 2;  // Line width

                // Draw the threshold line
                ctx.beginPath();
                ctx.moveTo(0+margin, thresholdY);  // Start from the left side
                ctx.lineTo(predChart.width-margin, thresholdY);  // End at the right side
                ctx.stroke();  // Actually draw the line

                // Draw bars for predValue
                var barWidth = chartWidth / predValue.length;
                for (i = 0; i < predValue.length; i++) {
                    x = margin + i * barWidth;
                    var barHeight = (Math.abs(predValue[i]) / 0.05) * chartHeight;
                    y = predValue[i] >= 0
                            ? predChart.height - margin - barHeight // Positive values
                            : predChart.height - margin;          // Negative values start from X-axis

                    ctx.fillStyle = predValue[i] >= 0 ? "rgba(0, 122, 255, 0.7)" : "rgba(255, 69, 0, 0.7)";
                    ctx.fillRect(x, y, barWidth - 2, barHeight);
                }
            }
        }

        // Connections for real-time updates
        Connections {
            target: AIObject
            onPredValueChanged: {
                predValue = AIObject.predValue;
                predChart.requestPaint();
            }
        }
    }
}




