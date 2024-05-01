import QtQuick 2.15
import "qrc:/ui/component/QtQuick/Studio/Components"
import "qrc:/ui/component/QtQuick/Studio/LogicHelper"

Item {
    id: ramFrame
    width: 250
    height: 250

    Item {
        id: backgroundElipse
        x: 0
        y: 0
        width: 250
        height: 250
        Image {
            id: backgroundElipse1
            x: 0
            y: 0
            source: "/ui/assets/backgroundElipse1.png"
        }
    }

    Item {
        id: outlineElipse
        x: 0
        y: 0
        width: 250
        height: 250
        Image {
            id: outlineElipse1
            x: 0
            y: 0
            source: "/ui/assets/outlineElipse1.png"

            ArcItem {
                id: arc
                width: 231
                height: 231
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                end: rangeMapper.output
                begin: -180
                capStyle: 32
                strokeWidth: 9
                strokeColor: "#e9e755"
                fillColor: "#00000000"
            }
        }
    }
    UsageTextElement {
        id: timerElement
        x: 37
        y: 73
        width: 176
        height: 121
        _45Text: BackendObject.ramText
        minutesRemainingText: "RAM Usage"
    }

    RangeMapper {
        id: rangeMapper
        input: BackendObject.ramPercentage
        outputMaximum: 360
    }

}


