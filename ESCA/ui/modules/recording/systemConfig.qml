import QtQuick 2.15
import "qrc:/ui/components/QtQuick/Studio/Components"
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
// import ConfigAudio 1.0


Rectangle {
    id: frame_22
    width: 1024
    height: 500
    color: "#262e4b"

    // properties for audio parameters
    property string inputDevice: '';
    property string outputDevice: '';
    property string duration: '10'
    property string fileSave: 'abckjefnvlermflermnvler';
    property string sampleRate: '44100';
    property string codec: 'codec';
    property string channels: '2';
    property string resolution: '8';


    property var inputSources: [];
    property var outputSources: [];
    property var  configValue: [];

    Component.onCompleted: {
        inputSources = RecordingObject.getInputAudioDeviceList();
        // outputSources = RecordingObject.getOutputAudioDeviceList();
        listInputDeviceModel.append({"name" : "none"});
        // listOutputDeviceModel.append({"name" : "none"});
        for (let i = 0; i < inputSources.length; ++i) {
            listInputDeviceModel.append({"name" : inputSources[i]});
        }
        console.log(listInputDeviceModel);
        // for (let j = 0; j<outputSources.length; ++j) {
        //     listOutputDeviceModel.append({"name" : outputSources[j]});
        // }
        configValue = RecordingObject.loadAduioConfigureParameters();
        console.log(configValue);
        inputDevice = configValue[0];
        outputDevice = configValue[1];
        fileSave = configValue[2];
        channels = configValue[3];
        sampleRate = configValue[4];
        resolution = configValue[5];
        duration = configValue[6];
    }

    Image {
        id: rectangle_59
        x: 20
        y: 207
        source: "/ui/assets/rec.png"
    }

    Image {
        id: rectangle_61
        x: 20
        y: 337
        source: "/ui/assets/rec.png"
    }

    Image {
        id: rectangle_60
        x: 20
        y: 273
        source: "/ui/assets/rec.png"



        TextEdit {
            id: sample_rate_textedit
            x: 344
            y: 16
            width: 130
            height: 27
            color: "#ffffff"
            text: sampleRate
            font.pixelSize: 18
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            mouseSelectionMode: TextInput.SelectWords
            selectByMouse: true
            overwriteMode: true
            selectionColor: "#2e52a3"
        }

        TextEdit {
            id: bits_per_sample_textedit
            x: 344
            y: 77
            width: 130
            height: 27
            color: "#ffffff"
            text: resolution
            font.pixelSize: 18
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            mouseSelectionMode: TextInput.SelectWords
            overwriteMode: true
            selectionColor: "#2e52a3"
            selectByMouse: true
        }

        TextEdit {
            id: numberofchannel_textedit
            x: 840
            y: 75
            width: 130
            height: 27
            color: "#ffffff"
            text: channels
            font.pixelSize: 18
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            mouseSelectionMode: TextInput.SelectWords
            overwriteMode: true
            selectionColor: "#2e52a3"
            selectByMouse: true
        }

        TextEdit {
            id: codec_textedit
            x: 840
            y: 16
            width: 130
            height: 27
            color: "#ffffff"
            text: codec
            font.pixelSize: 18
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            mouseSelectionMode: TextInput.SelectWords
            overwriteMode: true
            selectionColor: "#2e52a3"
            selectByMouse: true
        }

        TextEdit {
            id: duration_textedit
            x: 840
            y: -49
            width: 130
            height: 27
            color: "#ffffff"
            text: duration
            font.pixelSize: 18
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            mouseSelectionMode: TextInput.SelectWords
            overwriteMode: true
            selectionColor: "#2e52a3"
            selectByMouse: true
        }

    }

    Image {
        id: rectangle_58
        x: 20
        y: 120
        width: 989
        height: 80
        source: "/ui/assets/rec.png"
    }

    Text {
        id: sample_rate
        x: 49
        y: 289
        width: 160
        height: 24
        color: "#ffffff"
        text: qsTr("Sample rate")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    Text {
        id: choose_device_text
        x: 49
        y: 225
        width: 188
        height: 21
        color: "#ffffff"
        text: qsTr("Choose device")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    Text {
        id: bits_per_sample_text
        x: 49
        y: 356
        width: 203
        height: 23
        color: "#ffffff"
        text: qsTr("Bits per sample")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    Text {
        id: channels_text
        x: 541
        y: 352
        width: 258
        height: 23
        color: "#ffffff"
        text: qsTr("Number of channels")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    Text {
        id: code_dec
        x: 541
        y: 289
        width: 160
        height: 24
        color: "#ffffff"
        text: qsTr("Codec")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    Dialog {
            id: notificationDialog
            width: 300
            height: 150
            anchors.centerIn: parent
            title: "Notification"

            contentItem: Text {
                text: "Save completed!"
                anchors.centerIn: parent
            }

            standardButtons: Dialog.Ok

            onAccepted: {
                console.log("Save completed!");
            }

            onRejected: {
                console.log("Rejected");
            }
        }

    Image {
        id: save_btn
        x: 679
        y: 429
        width: 224
        height: 58
        source: "/ui/assets/btn.png"


        Text {
            x: 30
            y: 7
            width: 170
            height: 42
            color: "#ffffff"
            text: qsTr("Save")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Itim"
            font.weight: Font.Normal
        }

        // ConfigAudio {
        //     id: configAudio
        // }


        MouseArea {
            width: parent.width
            height: parent.height
            anchors.fill: parent

            onClicked: {
                let stringList = [];

                sampleRate = sample_rate_textedit.text;
                resolution = bits_per_sample_textedit.text;
                channels = numberofchannel_textedit.text;
                codec = codec_textedit.text;
                duration = duration_textedit.text;
                fileSave = folder_to_store.text;
                inputDevice = choose_device_combobox.currentText;

                console.log(choose_device_combobox);

                stringList.push(inputDevice); // input device
                stringList.push(inputDevice); // output device
                stringList.push(fileSave.substring(7)); // file path
                stringList.push(channels); // channels
                stringList.push(sampleRate); // sample rate
                stringList.push(resolution); // resolution
                stringList.push(duration); // duration

                // if(choose_device_combobox.currentIndex == 0)
                //     stringList.push("default");
                // else
                //     stringList.push("hw:2,0");

                // stringList.push(duration.charAt(0));

                // console.log(stringList);
                RecordingObject.saveAduioConfigureParameters(stringList);
                notificationDialog.visible = true;

            }
        }
    }

    Image {
        id: timer_btn
        x: 139
        y: 429
        width: 224
        height: 58
        source: "/ui/assets/btn.png"

        Text {
            x: 30
            y: 7
            width: 170
            height: 42
            color: "#ffffff"
            text: qsTr("Set timer")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Itim"
            font.weight: Font.Normal
        }


        MouseArea {
            width: parent.width
            height: parent.height
            anchors.fill: parent
            onClicked: {
                loader.source = "/ui/layout/setTimer.qml";
            }
        }
    }

    SvgPathItem {
        id: line_19_Stroke_
        x: 491
        y: 297
        width: 45
        height: 5
        strokeColor: "transparent"
        antialiasing: true
        fillColor: "#4d323d74"
        strokeWidth: 5
        rotation: -90
        path: "M 0 2.5 C 0 1.1192880868911743 1.1192880868911743 0 2.5 0 L 42.5 0 C 43.88071060180664 0 45 1.1192880868911743 45 2.5 C 45 3.8807119131088257 43.88071060180664 5 42.5 5 L 2.5 5 C 1.1192880868911743 5 0 3.8807119131088257 0 2.5 Z"
        strokeStyle: 1
        joinStyle: 0
    }

    SvgPathItem {
        id: line_20_Stroke_
        x: 492
        y: 361
        width: 44
        height: 5
        strokeColor: "transparent"
        antialiasing: true
        fillColor: "#4d323d74"
        strokeWidth: 5
        rotation: -90
        path: "M 0 2.5 C 0 1.1192880868911743 1.1192880868911743 0 2.5 0 L 41.5 0 C 42.88071060180664 0 44 1.1192880868911743 44 2.5 C 44 3.8807119131088257 42.88071060180664 5 41.5 5 L 2.5 5 C 1.1192880868911743 5 0 3.8807119131088257 0 2.5 Z"
        strokeStyle: 1
        joinStyle: 0
    }

    ComboBox {
        id: choose_device_combobox
        x: 301
        y: 217
        width: 195
        height: 35
        font.weight: Font.Normal
        font.family: "Courier"
        font.pointSize: 13
        // currentIndex: choose_device
        currentIndex: 0
        // background: Rectangle {
        //     color: "#f8c3dab8"
        //     border.color: "#435493"
        // }

        model: ListModel {
            id: listInputDeviceModel
        }


        // Customizing the appearance of items in the ComboBox
        // delegate: Item {
        //     width: choose_device_combobox.width
        //     height: 30

        //     Rectangle {
        //         width: parent.width
        //         height: parent.height
        //         color: "#dcb3c9a9"
        //         border.color: "#262e4b"

        //         Text {
        //             anchors.centerIn: parent
        //             text: modelData
        //             font.family: "Courier"
        //         }

        //         MouseArea {
        //             anchors.fill: parent
        //             onClicked: {
        //                 choose_device_combobox.currentIndex = index
        //             }
        //         }
        //     }
        // }
        //            Signal handler for item selection change
        onCurrentIndexChanged: {
            let selectedItem = inputSources[currentIndex] // Get the selected item
            RecodingObject.setInputAudioDevice(selectedItem);
            // Add logic here
        }
    }

    SvgPathItem {
        id: line_22_Stroke_
        x: 492
        y: 234
        width: 43
        height: 5
        strokeColor: "transparent"
        antialiasing: true
        fillColor: "#4d323d74"
        strokeWidth: 5
        rotation: -90
        path: "M 0 2.5 C 0 1.1192880868911743 1.1192880868911743 0 2.5 0 L 40.5 0 C 41.88071060180664 0 43 1.1192880868911743 43 2.5 C 43 3.8807119131088257 41.88071060180664 5 40.5 5 L 2.5 5 C 1.1192880868911743 5 0 3.8807119131088257 0 2.5 Z"
        strokeStyle: 1
        joinStyle: 0
    }

    Rectangle {
        id: rectangle_76
        x: 389
        y: 7
        width: 246
        height: 52
        color: "#69000822"
        radius: 8
        Text {
            x: 78
            y: 8
            color: "#ffffff"
            text: qsTr("Setting")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 24
            font.bold: false
        }
    }

    Text {
        id: choose_folder_text
        x: 44
        y: 150
        width: 266
        height: 21
        color: "#ffffff"
        text: qsTr("File's storage location")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.family: "Itim"
        font.weight: Font.Normal
    }

    TextInput {
        id: folder_to_store
        x: -3
        y: -3
        width: 501
        height: 24
        color: "#ffffff"
        text: fileSave
        font.pixelSize: 18
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors.verticalCenterOffset: -91
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 77
        font.family: "Josefin Sans"
        font.weight: Font.Light

        onTextChanged: {
            // add handler
        }
    }

    Rectangle {
        id: open_file_rec
        x: 850
        y: 141
        width: 150
        height: 36
        color: "#6935416c"
        radius: 8

        Text {
            x: 16
            y: 8
            width: 86
            height: 20
            color: "#ffffff"
            text: qsTr("Browser")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.family: "Itim"
            font.weight: Font.Normal
        }

        FileDialog {
            id: choose_file_save_record
            title: "Please choose a file"

            onAccepted: {

                function truncateText(text, maxLength) {
                    if (text.length > maxLength) {
                        return text.substring(41, maxLength - 3) + "..."
                    } else {
                        return text
                    }
                }

                // console.log("You choose: " + choose_file_save_record.folder)
                // console.log("You choose: " + truncateText(
                //                 "" + choose_file_save_record.folder, 60))

                // handle choose file
                folder_to_store.text = truncateText(
                            "" + choose_file_save_record.folder, 92)
            }
            onRejected: {
                console.log("Canceled")
                //                Qt.quit()
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                choose_file_save_record.open()
            }
        }

        SvgPathItem {
            width: 23
            height: 20
            anchors.verticalCenterOffset: 2
            path: "M 0 2.2857142857142856 C 0 1.0250000272478375 1.1771484687924385 0 2.625 0 L 8.043164312839508 0 C 8.826562765985727 0 9.5771484375 0.27142851693289616 10.130859375 0.7535713740757533 L 11.890429437160492 2.2857142857142856 L 18.375 2.2857142857142856 C 19.82285153120756 2.2857142857142856 21 3.310714312962123 21 4.571428571428571 L 21 13.714285714285714 C 21 14.974999972752162 19.82285153120756 16 18.375 16 L 2.625 16 C 1.1771484687924385 16 0 14.974999972752162 0 13.714285714285714 L 0 2.2857142857142856 Z M 2.625 1.7142857142857142 C 2.2640624921768904 1.7142857142857142 1.96875 1.9714285646166119 1.96875 2.2857142857142856 L 1.96875 13.714285714285714 C 1.96875 14.028571435383387 2.2640624921768904 14.285714285714285 2.625 14.285714285714285 L 18.375 14.285714285714285 C 18.73593750782311 14.285714285714285 19.03125 14.028571435383387 19.03125 13.714285714285714 L 19.03125 4.571428571428571 C 19.03125 4.257142850330897 18.73593750782311 4 18.375 4 L 11.755078375339508 4 C 11.320312734693289 4 10.901952624320984 3.8500001089913503 10.594335436820984 3.5821429661342075 L 8.740429937839508 1.9642857142857142 C 8.555859625339508 1.8035714285714284 8.305664316751063 1.7142857142857142 8.043164312839508 1.7142857142857142 L 2.625 1.7142857142857142 Z"
            antialiasing: true
            strokeStyle: 1
            anchors.centerIn: parent
            strokeWidth: 1
            anchors.horizontalCenterOffset: 51
            joinStyle: 0
            strokeColor: "#00000000"
        }
    }

    Text {
        id: code_dec1
        x: 541
        y: 225
        width: 160
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


}
