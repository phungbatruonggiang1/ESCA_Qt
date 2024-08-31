import QtQuick 2.15
import QtQuick.Controls 2.15
import AudioConfigImport 1.0

Rectangle {
    id: frame_1
    width: 1024
    height: 500

    // Rectangle {
    //     x: 0
    //     y: 0
    //     width: 180
    //     height: 312
    //     color: "red"

    //     Column {
    //         id: column
    //         spacing: 10
    //         topPadding: 20

    //         Rectangle {
    //             id: rectangle2
    //             width: 180
    //             height: 60
    //             color: "#00ffffff"

    //             Text {
    //                 id: text1
    //                 color: "blue"
    //                 anchors.centerIn: parent
    //                 text: qsTr("Visualize")
    //                 font.pixelSize: 22
    //                 font.family: "Oxanium"
    //             }
    //         }

    //         Rectangle {
    //             id: rectangle3
    //             width: 180
    //             height: 60
    //             color: "#00ffffff"
    //             Text {
    //                 color: "#ffffff"
    //                 text: qsTr("Config")
    //                 font.pixelSize: 22
    //                 font.family: "Oxanium"
    //                 anchors.centerIn: parent
    //             }
    //         }

    //         Rectangle {
    //             id: rectangle4
    //             width: 180
    //             height: 60
    //             color: "#00ffffff"
    //             Text {
    //                 color: "#ffffff"
    //                 text: qsTr("Timer")
    //                 font.pixelSize: 22
    //                 font.family: "Oxanium"
    //                 anchors.centerIn: parent
    //             }
    //         }

    //         Rectangle {
    //             id: rectangle5
    //             width: 180
    //             height: 60
    //             color: "#00ffffff"
    //             Text {
    //                 color: "#ffffff"
    //                 text: qsTr("FileManager")
    //                 font.pixelSize: 22
    //                 font.family: "Oxanium"
    //                 anchors.centerIn: parent
    //             }
    //         }
    //     }
    // }

    Rectangle {
        x: 200

        width: 800
        height: 440

        Component.onCompleted: {
            console.log("hell0"+AudioConfig.listEndianz);
            for (var i = 0; i < AudioConfig.listSampleRate.length; i++){
                sampleRateMl.append({"name" : AudioConfig.listSampleRate[i]});
            }
            for (i = 0; i < AudioConfig.listChannel.length; i++){
                channelMl.append({"name" : AudioConfig.listChannel[i]});
            }
            for (i = 0; i < AudioConfig.listEndianz.length; i++){
                endianzMl.append({"name" : ""+AudioConfig.listEndianz[i]});
            }
        }

        ComboBox {
            id: deviceCb
            x: 57
            y: 35
            width: 686
            height: 40
            font.pointSize: 18
            font.family: "Oxanium"
            currentIndex: AudioConfig.nearistParams[0]
            enabled: !RecordingObject.recStatus

            model: AudioConfig.listDevices

            onCurrentIndexChanged: {
                console.log("Selected choose_device Item:", deviceCb.currentText)
                AudioConfig.changeDevice(deviceCb.currentIndex)
                // console.log("Selected choose_device Item:", AudioConfig.selectedParams);
                // Add logic here
            }
        }

        Text {
            id: text17
            x: 374
            y: 8
            width: 53
            height: 26
            text: qsTr("device")
            font.pixelSize: 12
        }

        ComboBox {
            id: codecCb
            x: 44
            y: 124
            width: 157
            height: 40
            currentIndex: AudioConfig.nearistParams[1] >= 0 ? AudioConfig.nearistParams[1] : -1
            // currentIndex: -1
            font.pointSize: 18
            font.family: "Oxanium"
            enabled: !RecordingObject.recStatus

            model: AudioConfig.listCodecs

            onCountChanged: {

            }
        }

        Text {
            id: codecTx
            x: 44
            y: 98
            width: 53
            height: 26
            text: qsTr("codec")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 298
            y: 98
            width: 53
            height: 26
            text: qsTr("samplerate")
            font.pixelSize: 12
        }

        ComboBox {
            id: sampleRateCb
            x: 298
            y: 124
            width: 178
            height: 40
            currentIndex: AudioConfig.nearistParams[2]
            enabled: !RecordingObject.recStatus

            model: ListModel {
                id: sampleRateMl
            }

            font.pointSize: 18
            font.family: "Oxanium"
        }

        ComboBox {
            id: channelsCb
            x: 590
            y: 124
            font.family: "Oxanium"
            currentIndex: AudioConfig.nearistParams[3]
            font.pointSize: 18
            enabled: !RecordingObject.recStatus

            model: ListModel {
                id: channelMl
            }
        }

        Text {
            id: channelTx
            x: 590
            y: 98
            width: 53
            height: 26
            text: qsTr("channels")
            font.pixelSize: 12
        }

        ComboBox {
            id: endianzCb
            x: 309
            y: 233
            width: 157
            height: 40
            font.pointSize: 18
            currentIndex: AudioConfig.nearistParams[4]
            font.family: "Oxanium"
            enabled: !RecordingObject.recStatus

            model: ListModel {
                id: endianzMl
            }
        }

        Text {
            id: text5
            x: 309
            y: 207
            width: 53
            height: 26
            text: qsTr("endianz")
            font.pixelSize: 12
        }

        // Dialog {
        //     id: formatWarningDialog
        //     title: "Format You Choose Not Supported"
        //     visible: AudioConfig.nearistParams[5] === 0
        //     onVisibleChanged: {
        //         if (!visible) sAudioConfig.nearistParams[5] = 1;  // Reset visibility when dialog is closed
        //     }
        //     standardButtons: Dialog.Ok

        //     Label {
        //         text: "The selected format is not supported for recording."
        //         wrapMode: Text.WordWrap
        //         width: parent.width - 40
        //     }

        //     onAccepted: {
        //         AudioConfig.nearistParams[5] = 1;  // Hide the dialog when OK is pressed
        //     }
        // }

        Button {
            id: button
            x: 343
            y: 363
            text: qsTr("Save")
            enabled: !RecordingObject.recStatus

            onClicked: {
                //Load to Record Device
                console.log("from codec: " + codecCb.currentIndex)
                AudioConfig.saveConfig(deviceCb.currentIndex, codecCb.currentIndex, sampleRateCb.currentIndex, channelsCb.currentIndex, endianzCb.currentIndex)
                console.log("from qml: " + AudioConfig.listDevices[0])
                // console.log("click: " +devicename)
            }
        }
    }
}
