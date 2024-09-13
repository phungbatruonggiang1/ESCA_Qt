import QtQuick 2.15
import QtQuick.Controls 2.15
import AudioConfigImport 1.0

Rectangle {
    width: 800
    height: 440

    property int channelset: AudioConfig.nearistParams[3]

    Component.onCompleted: {

        console.log("nearistParams[3]: ", AudioConfig.nearistParams[3]);
        console.log("hell1"+AudioConfig.listChannel);
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
            // console.log("Selected choose_device Item:", audioConfig.selectedParams);
            // Add logic here
        }
    }

    Text {
        id: text1
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
        currentIndex: AudioConfig.nearistParams[1]
        font.pointSize: 18
        font.family: "Oxanium"
        enabled: !RecordingObject.recStatus

        model: AudioConfig.listCodecs
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
        x: 343
        y: 363
        text: qsTr("Save")
        enabled: !RecordingObject.recStatus

        onClicked: {
            //Load to Record Device
            console.log("from codec: " + codecCb.currentIndex)
            if (codecCb.currentIndex === -1) {
                minhDialog.visible = true;
            }
            else {
                AudioConfig.saveConfig(deviceCb.currentIndex, codecCb.currentIndex, sampleRateCb.currentIndex, channelsCb.currentIndex, endianzCb.currentIndex)
                console.log("audioConfig.listChannel[0]: " + AudioConfig.listChannel[0])
                // console.log("click: " +devicename)
            }

            console.log("nearistParams[3]: ", AudioConfig.nearistParams[3]);
        }
    }
}
