import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Rectangle {
    width: 800
    height: 500
    color: "#2a2a2a"
    radius: 20

    property int totalepoch: TransferObject.totalEpoch
    property int epoch: TransferObject.epoch
    Column {
        anchors.centerIn: parent
        width: 750
        spacing: 20

        Text {
            text: "Transfer Learning Monitor"
            font.pointSize: 28
            font.bold: true
            font.family: "Oxanium"
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: 750
            height: 80
            color: "#333333"
            radius: 15
            border.color: "#555555"

            Row {
                spacing: 30
                anchors.centerIn: parent

                Text {
                    id: transferStatusTx
                    text: "Status: "+ (transferStatus?"Idle":"Not Running")
                    font.pointSize: 18
                    font.family: "Oxanium"
                    color: "#ffffff"
                }

                ProgressBar {
                    id: transferProgressBar
                    width: 400
                    height: 25
                    from: 0
                    to: 100
                    // value: 0
                    value: Math.round((epoch/totalepoch)*100)
                }

                Text {
                    id: progressPercentage
                    text: transferProgressBar.value + "%"
                    font.pointSize: 18
                    font.family: "Oxanium"
                    color: "#ffffff"
                }
            }
        }

        Rectangle {
            width: 750
            height: 300
            color: "#1a1a1a"
            radius: 15
            border.color: "#555555"

            Column {
                spacing: 10
                anchors.fill: parent
                anchors.margins: 15

                Text {
                    text: "Transfer Log"
                    font.pointSize: 20
                    font.bold: true
                    font.family: "Oxanium"
                    color: "#ffffff"
                }

                ListView {
                    id: logView
                    width: parent.width
                    height: 400
                    model: logModel
                    delegate: Column {
                        width: parent.width
                        spacing: 5

                        Text {
                            text: epochModel
                            color: "#ffffff"
                            font.pixelSize: 14
                        }
                        Text {
                            // text: "Total Loss: " + model.totalLoss + ", Reconstruction Loss: " + model.reconstructionLoss
                            text: detailsModel
                            color: "#ffffff"
                            font.pixelSize: 14
                        }
                        // Text {
                        //     text: "Model Loss: " + model.modelLoss + ", Supervised Loss: " + model.supervisedLoss
                        //     // color: "#000000"
                        //     font.pixelSize: 14
                        // }
                        Rectangle {
                            width: parent.width
                            height: 1
                            color: "#555555"
                        }
                    }
                }

                ListModel {
                    id: logModel
                    // ListElement { modelData: "Initializing transfer learning..." }
                    // ListElement { modelData: "Loading data..." }
                    // ListElement { modelData: "Training started..." }
                    ListElement {
                        epochModel: "Initializing transfer learning..."
                        detailsModel: "Loading data..."
                    }
                    ListElement {
                        epochModel: "Training started..."
                        detailsModel: " "
                    }
                }
            }
        }
    }

    Connections {
        target: TransferObject
        onEpochChanged: {
            logModel.append({
                                epochModel: "Epoch: " + TransferObject.epoch + ", Step: " + TransferObject.stepType,
                                detailsModel: TransferObject.details
                            });
        }
    }

    // Timer {
    //     id: updateTimer
    //     interval: 1000
    //     repeat: true
    //     running: true
    //     onTriggered: {
    //         if (transferProgressBar.value < 100) {
    //             transferProgressBar.value += 10;
    //             progressPercentage.text = transferProgressBar.value + "%";
    //             logModel.append({ modelData: "Progress: " + transferProgressBar.value + "%" });

    //             if (transferProgressBar.value === 100) {
    //                 transferStatus.text = "Status: Complete";
    //                 logModel.append({ modelData: "Transfer learning complete!" });
    //             }
    //         }
    //     }
    // }
}
