/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

//import QtQuick 2.0
import QtQuick 2.7
import QtGraphicalEffects 1.0
import "Global"

Rectangle {
    id: container

    property alias text: label.text
    property int ftSize: fontSize
//    property string downColor: "#333333"
//    property string gradientColor: "#888888"
    property string bgColor: Variables.buttonColor
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
    property int paintedW: label.paintedWidth
    property bool alignHorCenter: true
    property bool enableShadow: false
    property real widthRate: 2.0
    property int bRound: 0  // 0 - normal, 1 - top round, 2 - bottom round
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

    width: label.paintedWidth * widthRate
    height: label.paintedHeight * 2.2
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

    Text {
        id: label
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: container.ftSize
        font.family: container.fontFamily
        font.underline: bUnderLine
        font.bold: bBold
        color: {
            if (container.enabled === false)
                return Variables.disableTextColor
            if (selected)
                return selectTextColor
            if (mouseArea.pressed)
                return pressTextColor
            if (mouseArea.containsMouse)
                return hoverTextColor
            return textColor
        }
    }
    Component.onCompleted: {
        if (alignHorCenter === true)
            label.anchors.horizontalCenter = container.horizontalCenter
        else
        {
            label.anchors.left = container.left
            label.anchors.leftMargin = scaledMargin
        }
    }
}

