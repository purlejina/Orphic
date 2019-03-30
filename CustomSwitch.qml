import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Switch {
    id: switcher
//    anchors.fill: parent
    checked: false
    style: SwitchStyle {
        groove: Rectangle {
            id: switchGroove
            implicitWidth: 75
            implicitHeight: 30
            color: switcher.checked ? "green" : "#2d3446"
            border.width: 1
        }
        handle: Rectangle {
            id: switchHandle
            implicitHeight: parent.height * 1.5
            implicitWidth: 35
            color: "#10c7ff"
            border.width: 1
        }
    }
}

