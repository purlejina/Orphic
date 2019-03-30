import QtQuick 2.7
import QtGraphicalEffects 1.0
import "Global"

Rectangle {
    id: container

    property alias imgPath: image.source
    property string bgColor: Variables.backgroundColor
    property string pressColor: "#cc10c7ff"
    property string hoverColor: "#dddddd"
    property string selectColor: "#10c7ff"
    property string fontFamily: "Arial"
    property string textColor: Variables.textColor
    property string pressTextColor: "white"
    property string hoverTextColor: Variables.textColor
    property string selectTextColor: "white"
    property int widthMargins: 20
    property int heightMargins: 6
    property bool bUnderLine: false
    property bool bBold: false
    property bool selected: false
    signal clicked
    property bool alignHorCenter: true
    property bool enableShadow: false
    property real widthRate: 2.0
    property int bRound: 0  // 0 - normal, 1 - top round, 2 - bottom round
    property real scaleFactor: 1.2
    property string upColor: {
        if (mouseArea.pressed)
            return pressColor
        if (selected)
            return selectColor
        if (mouseArea.containsMouse)
            return hoverColor
        return bgColor
    }
    property string gradientColor: {
        if (mouseArea.pressed)
            return "#cc0087bf"
        if (selected)
            return "#0087bf"
        if (mouseArea.containsMouse)
            return "#888888"
        return "#999999"
    }

//    width: label.paintedWidth * widthRate
//    height: label.paintedHeight * 2.2
    antialiasing: true
//    radius: height / 10
    border.width: 0

    color: upColor
//    gradient: Gradient {
//        GradientStop { id: gradientStop; position: 0.0; color: upColor }
//        GradientStop { position: 1.0; color: gradientColor }
//    }

    Rectangle{
        id: shadowRect
        anchors.fill: parent
        color: parent.color
        radius: parent.radius
        border.width: parent.border.width
        border.color: parent.border.color
        visible: false
    }
    Rectangle{
        width: parent.width
        height: parent.height / 2
        color: parent.color
        anchors.bottom: parent.bottom
        visible: bRound === 1 ? true : false
    }

    Rectangle{
        width: parent.width
        height: parent.height / 2
        anchors.top: parent.top
        color: parent.color
        visible: bRound === 2 ? true : false
    }

    DropShadow {
        anchors.fill: shadowRect
        horizontalOffset: 2
        verticalOffset: 5
        radius: 7.0
        samples: 17
        color: "#50000000"
        source: shadowRect
        enabled: enableShadow
        visible: enableShadow
    }
    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: { container.clicked() }
    }

    Image {
        id: image
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
        width: parent.width / scaleFactor
        height: parent.height / scaleFactor
    }
}

