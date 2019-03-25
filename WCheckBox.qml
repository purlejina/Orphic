import QtQuick 2.0
import QtQuick 2.6
import QtQuick.Controls 2.1
import "Global"

CheckBox {
    id: control
    checked: false
    font.bold: false
    font.pixelSize: fontSize / 1.1
    indicator: Rectangle {
        implicitWidth: 17
        implicitHeight: 17
        x: 0
        y: parent.height / 2 - height / 2
        radius: 0
        border.color: control.down ? Variables.focusColor : Variables.borderNormalColor
        color: control.checked ? Variables.focusColor : Variables.backgroundColor

        Image {
            id: checkImage
            source: "Images/checkmarkwhite.png"
            anchors.fill: parent
            anchors.margins: parent.width / 5
            fillMode: Image.PreserveAspectFit
            smooth: true
            visible: checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: Variables.textColor//control.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
