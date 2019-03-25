import QtQuick 2.9
import QtQuick.Controls 2.2
import "Global"

ComboBox {
    id: control
    leftPadding: 2
    rightPadding: scaledMargin

    delegate: ItemDelegate {
        width: control.width
        contentItem: Text {
            text: modelData
            color: Variables.textColor
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            onPressedChanged: canvas.requestPaint()
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.focus ? Variables.focusColor : Variables.borderNormalColor//control.pressed ? "#17a81a" : "#21be2b";
            context.fill();
        }
    }
    onFocusChanged: {
        canvas.requestPaint()
    }

    contentItem: Text {
        leftPadding: control.leftPadding
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: Variables.textColor //control.pressed ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        border.color: control.focus ? Variables.focusColor : Variables.borderNormalColor//control.pressed ? "#17a81a" : "#21be2b"
        border.width: control.visualFocus ? 2 : 1
        radius: 0
    }

    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: Variables.focusColor
            radius: 2
        }
    }
}
