import QtQuick 2.15
import QtQuick.Controls 2.15
import AudioConfigImport 1.0
import QtQuick.Dialogs 1.3
// import Qt.labs.platform 1.0

Rectangle {
    width: 800
    height: 480
    color: "#161525"
    property alias deviceCbRightPadding: deviceCb.rightPadding

    Component.onCompleted: {

        // console.log("nearistParams[0]: ", deviceIndex);
        console.log("AudioConfig.nearistParams[5]: "+AudioConfig.nearistParams[5]);
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

        testtext.text = "" + AudioConfig.nearistParams;
    }

    ComboBox {
        id: deviceCb
        x: 56
        y: 60
        width: 686
        height: 40
        font.pointSize: 18
        font.family: "Oxanium"
        currentIndex: AudioConfig.nearistParams[0]
        enabled: !RecordingObject.recStatus
        model: AudioConfig.listDevices

        onCurrentIndexChanged: {
            // console.log("Selected choose_device Item:", deviceCb.currentText)
            AudioConfig.changeDevice(deviceCb.currentIndex)
        }
    }

    Text {
        id: text1
        x: 332
        y: 36
        width: 134
        height: 26
        color: "#ffffff"
        text: qsTr("Input Device Name")
        font.pixelSize: 15
        font.family: "Oxanium"
    }

    Rectangle {
        id: deviceOutCb
        x: 56
        y: 140
        width: 686
        height: 40
        color: "#e0e0e0"

        // model: AudioConfig.listOutput

        Text {
            id: outputFolderTx
            text: "Click here to Choose"
            anchors.centerIn: parent
            font.pixelSize: 20
            anchors.rightMargin: 20
            anchors.bottomMargin: 18
            font.family: "Oxanium"
        }

        FileDialog {
            id: fileDialog
            title: "Chọn một file"            
            onAccepted: {
                outputFolderTx.text = fileDialog.folder + "/"
                console.log("File đã c  họn: " + fileDialog.fileUrl)
            }
            onRejected: {
                console.log("Chọn file bị hủy")
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                fileDialog.open();
            }
        }
    }
    
    Text {
        id: deviceOutTx
        x: 329
        y: 115
        width: 140
        height: 26
        color: "#ffffff"
        text: qsTr("Stored Audio Folder")
        font.pixelSize: 15
        font.family: "Oxanium"
    }
    Rectangle {
                id: rectangle2
                x: 56
                y: 140
                border.color: "black"
                width: 686
                height: 40
                radius: 10
                color: "#ffffff"
                TextField {
                    id: text31
                    x: 8
                    y: 0
                    width: 600
                    height: 36
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: "Choose folder to open"
                    maximumLength: 100
                    background: Rectangle {
                        border.width: 0
                        color: "transparent"
                    }
                }
                FolderDialog {
                    id: folderDialog
                    onAccepted: {
                        text31.text = folderDialog.folder
                        console.log("hi Giang, show the folder url: ", folderDialog.folder);
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }
                Rectangle {
                    id: rectangle_82
                    x: 619
                    y: 0
                    width: 32
                    height: 36
                    color: "#ffffff"
                    radius: 8

                    Image {
                        id: folderopenregular
                        x: 4
                        y: 8
                        width: 24
                        height: 23
                        source: "../images/folder-open-regular.svg"
                        fillMode: Image.PreserveAspectFit
                    }

                    MouseArea {
                        anchors.centerIn: parent
                        anchors.fill: parent
                        onClicked: {
                            folderDialog.open();
                        }
                    }
                }
            }

    ComboBox {
        id: codecCb
        x: 56
        y: 220
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
        x: 56
        y: 198
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Codec")
        font.pixelSize: 15
        font.family: "Oxanium"
    }

    Text {
        id: text3
        x: 310
        y: 198
        width: 90
        height: 26
        color: "#ffffff"
        text: qsTr("Sample Rate (Hz)")
        font.pixelSize: 15
        font.family: "Oxanium"
    }

    ComboBox {
        id: sampleRateCb
        x: 310
        y: 220
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
        x: 585
        y: 220
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
        x: 585
        y: 198
        width: 67
        height: 26
        color: "#ffffff"
        text: qsTr("Channels")
        font.pixelSize: 15
        font.family: "Oxanium"
    }

    ComboBox {
        id: endianzCb
        x: 310
        y: 309
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
        x: 310
        y: 289
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Endianz")
        font.pixelSize: 15
        font.family: "Oxanium"
    }

    ComboBox {
        id: sampleSizeCb
        x: 56
        y: 309
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
        x: 585
        y: 309
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
        x: 56
        y: 289
        width: 84
        height: 26
        color: "#ffffff"
        text: qsTr("Sample Size (bits)")
        font.pixelSize: 15
        font.family: "Oxanium"
    }

    Text {
        id: durationText
        x: 585
        y: 289
        width: 53
        height: 26
        color: "#ffffff"
        text: qsTr("Duration (seconds)")
        font.pixelSize: 15
        font.family: "Oxanium"
    }
/*
     Dialog {
        id: formatWarningDialog
        title: "Format You Choose Not Supported"
        visible: !AudioConfig.saveDone
        standardButtons: Dialog.Ok
//        anchors.centerIn: parent

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

            function onNearistParamsChanged() {
                codecCb.currentIndex = AudioConfig.nearistParams[1]
                sampleRateCb.currentIndex = AudioConfig.nearistParams[2]
                channelsCb.currentIndex = AudioConfig.nearistParams[3]
                endianzCb.currentIndex = AudioConfig.nearistParams[4]
                sampleSizeCb.currentIndex = AudioConfig.nearistParams[5]
                console.log("test sig qml", AudioConfig.saveDone);
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
//        anchors.centerIn: parent

        Label {
            text: "Unknown field port, please choose another device"
            wrapMode: Text.WordWrap
            width: parent.width - 40
        }
        onAccepted: minhDialog.visible = false
    }
    */

    Button {
        id: button
        x: 321
        y: 390
        width: 158
        height: 52
        text: qsTr("Save")
        font.pointSize: 14
        font.family: "Oxanium"
        enabled: !RecordingObject.recStatus

        onClicked: {
            //Load to Record Device
            // console.log("from codec: " + codecCb.currentIndex)
            if (codecCb.currentIndex === -1) {
                minhDialog.visible = true;
            }
            else {
                AudioConfig.saveConfig(deviceCb.currentIndex, codecCb.currentIndex, sampleRateCb.currentIndex, channelsCb.currentIndex, endianzCb.currentIndex, sampleSizeCb.currentIndex, durationCb.currentIndex)
                // console.log("audioConfig.listChannel[0]: " + AudioConfig.listChannel[0])
                // console.log("click: " +devicename)
            }
            testtext.text = "" + AudioConfig.nearistParams;
            console.log("AudioConfig.nearistParams[5]: ", AudioConfig.nearistParams[5]);
        }
    }

    Text {
        id: testtext
        x: 42
        y: 378
        width: 158
        height: 56
        color: "#ffffff"
        text: qsTr("Test Text")
        font.pixelSize: 12
        styleColor: "#ffffff"
    }

}
