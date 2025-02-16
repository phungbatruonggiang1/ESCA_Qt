import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: realtimeConfigWindow
    width: 1024
    height: 500
    color: "#151515"
    radius: 10
    border.color: "#414141"

    // Bố cục chính
    ColumnLayout {
        x: 106
        y: 31
        width: 812
        height: 89
        spacing: 15

        // Tiêu đề
        Text {
            text: "REALTIME Configuration"
            font.pixelSize: 24
            font.family: "Oxanium"
            font.bold: true
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Log Path:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 600
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: logPathInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.logPath
                    color: "#FFFFFF"
                    onTextChanged: {
                        ConfigManager.logPath = text
                        ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                    }
                }
            }
        }
    }

    ColumnLayout {
        x: 152
        y: 140
        spacing: 15

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Manual Threshold:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: manualThresholdInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.manualThreshold.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseFloat(text)
                        if (!isNaN(value) && value >= 0 && value <= 1) {
                            ConfigManager.manualThreshold = value
                            ConfigManager.saveConfig()
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Runtime (ms):"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: runtimeInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.runtime.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 100 && value <= 10000) {
                            ConfigManager.runtime = value
                            ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Device Index Input:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: deviceIndexInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.deviceIndexInput.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 0 && value <= 32) {
                            ConfigManager.deviceIndexInput = value
                            ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Transfer Learning:"
                font.pointSize: 14
                font.family: "Oxanium"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
            }

            CheckBox {
                id: transferLearningCheckbox
                checked: ConfigManager.transferLearning
                onCheckedChanged: {
                    ConfigManager.transferLearning = checked
                    ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                }
            }
        }
    }

    ColumnLayout {
        x: 551
        y: 140
        spacing: 15

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Channels:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: channelsInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.channels.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 1 && value <= 8) {
                            ConfigManager.channels = value
                            ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Sampling Rate:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: samplingRateInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.samplingRate.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 8000 && value <= 96000) {
                            ConfigManager.samplingRate = value
                            ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Second:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            Rectangle {
                width: 100
                height: 30
                color: "#222222"
                radius: 5
                border.color: "#FFFFFF"

                TextInput {
                    id: secondInput
                    anchors.fill: parent
                    anchors.margins: 5
                    text: ConfigManager.second.toString()
                    color: "#FFFFFF"
                    onTextChanged: {
                        var value = parseInt(text)
                        if (!isNaN(value) && value >= 1 && value <= 60) {
                            ConfigManager.second = value
                            ConfigManager.saveConfig("/home/haiminh/Desktop/Anomaly_Detection/D-ESCA_v2/config/default.json")
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            Text {
                text: "Import File:"
                color: "#FFFFFF"
                Layout.alignment: Qt.AlignLeft
                Layout.minimumWidth: 200
                font.pointSize: 14
                font.family: "Oxanium"
            }

            CheckBox {
                id: importFileCheckbox
                checked: ConfigManager.importFile
                onCheckedChanged: {
                    ConfigManager.importFile = checked
                    ConfigManager.saveConfig()
                }
            }
        }
    }

    Button {
        id: button
        x: 447
        y: 371
        text: qsTr("Inference Screen")

        onClicked: {
            screenLoader.source = "./realTimeInference_data.qml"
        }
    }
}
