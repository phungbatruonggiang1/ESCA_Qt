import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
    width: 800
    height: 500
    color: "#2a2a2a"

    property int totalEpoch: TransferObject.totalEpoch
    property int epoch: TransferObject.epoch
    property int tlStatus: TransferObject.tlStatus

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Tiêu đề ứng dụng
        Text {
            text: "Transfer Learning Monitor"
            font.pointSize: 24
            font.bold: true
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Status & Progress Bar
        Rectangle {
            width: parent.width
            height: 80
            color: "#333333"
            radius: 15
            border.color: "#555555"

            Row {
                anchors.centerIn: parent
                spacing: 30

                Text {
                    text: "Status: " + (tlStatus ? "Idle" : "Not Running")
                    font.pointSize: 18
                    color: "#ffffff"
                }

                ProgressBar {
                    width: 400
                    height: 25
                    from: 0
                    to: 100
                    value: totalEpoch > 0 ? Math.round((epoch / totalEpoch) * 100) : 0
                }

                Text {
                    text: Math.round((epoch / totalEpoch) * 100) + "%"
                    font.pointSize: 18
                    color: "#ffffff"
                }
            }
        }

        // Log View (TextArea)
        Rectangle {
            width: parent.width
            height: 300
            color: "#1a1a1a"
            radius: 15
            border.color: "#555555"

            ScrollView {
                anchors.fill: parent
                anchors.margins: 10
                clip: true

                TextArea {
                    id: logArea
                    readOnly: true
                    wrapMode: TextArea.Wrap
                    textFormat: TextEdit.PlainText
                    font.pixelSize: 14
                    color: "#ffffff"
                    background: Rectangle { color: "transparent" }
                }
            }
        }
    }

    // Cập nhật log khi epoch thay đổi
    Connections {
        target: TransferObject
        onEpochChanged: {
            logArea.append("Epoch " + epoch + "/" + totalEpoch + " | Step: " + TransferObject.stepType + "\n" + TransferObject.details + "\n")
        }
    }
}
