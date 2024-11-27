// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Controls 2.15
import ProjectImport 1.0 // IMport component: Constants, Animation, ...
import "component"

ApplicationWindow {
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    visible: true


    Loader {
        id: screenLoader
        anchors.top: topbar.bottom
        anchors.bottom: mainmenu.top
        source: "./Base/FullScreen.qml"
    }

    TopBar {
        id: topbar
    }

    // Bottom bar
    BottomMenu {
        id: mainmenu
    }

}

