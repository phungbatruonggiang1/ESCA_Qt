import QtQuick 2.15
import QtQuick.Controls 2.15

QtObject {
    id: notificationManager

    property string message: ""
    property bool visible: false

    function showMessage(msg) {
        message = msg;
        visible = true;
        startAutoHide();
    }

    // function startAutoHide() {
    //     hideTimer.restart();
    // }

    // Timer {
    //     id: hideTimer
    //     interval: 10000 // Popup tự động ẩn sau 10 giây
    //     running: false
    //     onTriggered: notificationManager.visible = false
    // }
}
