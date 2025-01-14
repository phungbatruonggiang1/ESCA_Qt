import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
    width: 800
    height: 500
    color: "#2a2a2a"
    radius: 20

    ColumnLayout {
        anchors.centerIn: parent
        width: 750
        height: 500
        anchors.verticalCenterOffset: -172
        anchors.horizontalCenterOffset: 0
        spacing: 20

        Text {
            text: "Transfer Learning Results"
            font.pointSize: 28
            font.bold: true
            font.family: "Oxanium"
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter

            Button {
                text: "Loss Diagram"
                font.family: "Oxanium"
                font.pointSize: 16
                onClicked: {
                    stackView.currentIndex = 0
                }
            }

            Button {
                text: "PR Curve"
                font.family: "Oxanium"
                font.pointSize: 16
                onClicked: {
                    stackView.currentIndex = 1
                }
            }

            Button {
                text: "Validation vs Test"
                font.family: "Oxanium"
                font.pointSize: 16
                onClicked: {
                    stackView.currentIndex = 2
                }
            }
        }

        StackLayout {
            id: stackView
            height: 300
            Layout.fillWidth: true
            Layout.fillHeight: true

            currentIndex: 0

            Canvas {
                id: lossDiagram
                Layout.fillWidth: true
                Layout.fillHeight: true
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);
                    ctx.strokeStyle = "#ffffff";
                    ctx.lineWidth = 2;

                    ctx.beginPath();
                    ctx.moveTo(50, 400);
                    ctx.lineTo(150, 300);
                    ctx.lineTo(250, 200);
                    ctx.lineTo(350, 100);
                    ctx.stroke();

                    ctx.fillStyle = "#ffffff";
                    ctx.font = "16px Oxanium";
                    ctx.fillText("Loss", 10, 20);
                }
            }

            Canvas {
                id: prCurve
                Layout.fillWidth: true
                Layout.fillHeight: true
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);
                    ctx.strokeStyle = "#ffffff";
                    ctx.lineWidth = 2;

                    ctx.beginPath();
                    ctx.moveTo(50, 400);
                    ctx.lineTo(150, 350);
                    ctx.lineTo(250, 250);
                    ctx.lineTo(350, 150);
                    ctx.stroke();

                    ctx.fillStyle = "#ffffff";
                    ctx.font = "16px Oxanium";
                    ctx.fillText("Precision-Recall", 10, 20);
                }
            }

            Canvas {
                id: validationTest
                Layout.fillWidth: true
                Layout.fillHeight: true
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);
                    ctx.strokeStyle = "#ffffff";
                    ctx.lineWidth = 2;

                    // Validation Accuracy
                    ctx.beginPath();
                    ctx.moveTo(50, 300);
                    ctx.lineTo(150, 250);
                    ctx.lineTo(250, 200);
                    ctx.lineTo(350, 150);
                    ctx.strokeStyle = "#00ff00";
                    ctx.stroke();

                    // Test Accuracy
                    ctx.beginPath();
                    ctx.moveTo(50, 350);
                    ctx.lineTo(150, 300);
                    ctx.lineTo(250, 250);
                    ctx.lineTo(350, 200);
                    ctx.strokeStyle = "#ff0000";
                    ctx.stroke();

                    ctx.fillStyle = "#ffffff";
                    ctx.font = "16px Oxanium";
                    ctx.fillText("Validation vs Test", 10, 20);
                }
            }
        }
    }
}
