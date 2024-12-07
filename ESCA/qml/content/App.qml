// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

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

    TopBar {
        id: topbar
    }

    HomeButton {
        id: homeButton
    }

}

