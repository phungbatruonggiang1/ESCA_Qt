import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0 // IMport component: Constants, Animation, ...
import "component"
import "Base"

ApplicationWindow {
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    visible: true

    Loader {
        id: screenLoader
        anchors.top: topbar.bottom
        source: "./Base/FullScreen.qml"
    }

    // Khởi tạo NotificationManager
    NotificationManager {
        id: notificationManager
    }

    TopBar {
        id: topbar
    }

    HomeButton {
        id: homeButton
    }

}

