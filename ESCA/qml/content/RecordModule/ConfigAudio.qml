import QtQuick 2.15
import QtQuick.Controls 2.15
import AudioConfigImport 1.0

Rectangle {
    width: 800
    height: 440
    color: "#161525"

    property int channelset: AudioConfig.nearistParams[3]

    Component.onCompleted: {

        console.log("nearistParams[3]: ", AudioConfig.nearistParams[3]);
        console.log("hell1"+AudioConfig.listChannel);
        for (var i = 0; i < AudioConfig.listSampleRate.length; i++){
            sampleRateMl.append({"name" : AudioConfig.listSampleRate[i]});
        }
        for (i = 0; i < AudioConfig.listSampleSize.length; i++){
            sampleSizeMl.append({"name" : AudioConfig.listSampleSize[i]});
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
        y: 32
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
            // console.log("Selected choose_device Item:", audioConfig.selectedParams);
            // Add logic here
        }
    }

    Text {
        id: text1
        x: 355
        y: 8
        width: 92
        height: 26
        color: "#ffffff"
        text: qsTr("Device Name")
        font.pixelSize: 15
    }

    ComboBox {
        id: codecCb
        x: 57
        y: 124
        width: 157
        height: 40
        currentIndex: AudioConfig.nearistParams[1]
        font.pointSize: 18
        font.family: "Oxanium"
        enabled: !RecordingObject.recStatus

        model: AudioConfig.listCodecs
    }

    Text {
        id: codecTx
        x: 57
        y: 98
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Codec")
        font.pixelSize: 15
    }

    Text {
        id: text3
        x: 311
        y: 98
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Sample Rate")
        font.pixelSize: 15
    }

    ComboBox {
        id: sampleRateCb
        x: 311
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
        x: 586
        y: 124
        width: 157
        height: 40
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
        x: 586
        y: 98
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Channels")
        font.pixelSize: 15
    }

    ComboBox {
        id: endianzCb
        x: 311
        y: 213
        width: 178
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
        x: 311
        y: 187
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Endianz")
        font.pixelSize: 15
    }

    Dialog {
        id: formatWarningDialog
        title: "Format You Choose Not Supported"
        visible: !AudioConfig.saveDone
        standardButtons: Dialog.Ok
        anchors.centerIn: parent

        Label {
            text: "The selected format is not supported for recording - USE NEARIST FORMAT."
            wrapMode: Text.WordWrap
            width: parent.width - 40
        }

        Connections {
            target: AudioConfig
            function onSaveDoneChanged() {
                formatWarningDialog.visible = !AudioConfig.saveDone
                console.log("audioConfig.saveDone:", AudioConfig.saveDone);
                channelsCb.currentIndex = AudioConfig.nearistParams[3]
                codecCb.currentIndex = AudioConfig.nearistParams[1]
                sampleRateCb.currentIndex = AudioConfig.nearistParams[2]
                endianzCb.currentIndex = AudioConfig.nearistParams[4]
                sampleSizeCb.currentIndex = AudioConfig.nearistParams[5]
            }
        }

        onAccepted: {
            AudioConfig.saveDone = !AudioConfig.saveDone
            // audioConfig.saveDone = true;  // Hide the dialog when OK is pressed
            // codecCb.currentIndex = audioConfig.nearistParams[1]
            // sampleRateCb.currentIndex = audioConfig.nearistParams[2]
            // channelsCb.currentIndex = audioConfig.nearistParams[3]
            // endianzCb.currentIndex = audioConfig.nearistParams[4]
        }
    }

    Dialog {
        id: minhDialog
        title: "Format You Choose Not Supported"
        visible: false
        standardButtons: Dialog.Ok
        anchors.centerIn: parent

        Label {
            text: "Unknown field port, please choose another device"
            wrapMode: Text.WordWrap
            width: parent.width - 40
        }
        onAccepted: minhDialog.visible = false
    }

    Button {
        id: button
        x: 322
        y: 346
        width: 158
        height: 52
        text: qsTr("Save")
        enabled: !RecordingObject.recStatus

        onClicked: {
            //Load to Record Device
            console.log("from codec: " + codecCb.currentIndex)
            if (codecCb.currentIndex === -1) {
                minhDialog.visible = true;
            }
            else {
                AudioConfig.saveConfig(deviceCb.currentIndex, codecCb.currentIndex, sampleRateCb.currentIndex, channelsCb.currentIndex, endianzCb.currentIndex, sampleSizeCb.currentIndex, durationCb.currentIndex)
                console.log("audioConfig.listChannel[0]: " + AudioConfig.listChannel[0])
                // console.log("click: " +devicename)
            }

            console.log("nearistParams[3]: ", AudioConfig.nearistParams[3]);
        }
    }

    ComboBox {
        id: sampleSizeCb
        x: 57
        y: 213
        width: 157
        height: 40
        enabled: !RecordingObject.recStatus
        currentIndex: AudioConfig.nearistParams[5]
        font.family: "Oxanium"
        font.pointSize: 18

        model: ListModel {
            id: sampleSizeMl
        }
    }

    ComboBox {
        id: durationCb
        x: 586
        y: 213
        width: 157
        height: 40
        enabled: !RecordingObject.recStatus
        currentIndex: AudioConfig.nearistParams[6]
        font.family: "Oxanium"
        font.pointSize: 18

        model: AudioConfig.listDuration
    }

    Text {
        id: sampleSizeTx
        x: 57
        y: 187
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Sample Size")
        font.pixelSize: 15
    }

    Text {
        id: durationText
        x: 586
        y: 187
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Duration")
        font.pixelSize: 15
    }
}
