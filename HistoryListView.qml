import QtQuick 2.7
import "Global"

Rectangle {
    id: page
    Component {
        id: walletlistviewDelegate
        Item {
            id: recipe

            width: listView.width
            height: lineHeight * 2 + scaledMargin / 2

            MouseArea {
                id: mousearea
                anchors.fill: parent
                onClicked: {
                }
            }
            Rectangle
            {
                height: parent.height - scaledMargin / 2
                width: parent.width - 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                border.width: 1
//                radius: 5
                border.color: "black"
                color: "transparent"
                Rectangle{
                    id: infoRect
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: scaledMargin / 2
                    width: parent.width - scaledMargin / 2
                    color: "transparent"
                    Rectangle{
                        id: firstLine
                        width: parent.width
                        height: lineHeight
                        color: "transparent"
                        Text{
                            id: txtDate
                            text: "Claimed on: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: itemWidth / 1.5
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Text{
                            id: txtTypeContent
                            text: hdate
                            color: Variables.textColor
                            font.pixelSize: fontSize / 1.2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtDate.right
                            anchors.right: parent.right
                        }

                    }
                    Rectangle{
                        id: secondLine
                        anchors.top: firstLine.bottom
                        width: parent.width
                        height: lineHeight
                        color: "transparent"
                        Text{
                            id: txtID
                            text: "Transaction ID: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: itemWidth / 1.5
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Text{
                            id: txtIdContent
                            text: htransitionid
                            color: Variables.textColor
                            font.pixelSize: fontSize / 1.2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtID.right
                            anchors.right: parent.right
                        }
                    }
                }
            }
        }
    }

    ListView {
        id: listView
        width: parent.width
        height: parent.height
        clip: true
        model: historyModel
        delegate: walletlistviewDelegate
    }
    PScrollBar {
        id: scrollbar
        flickable: listView;
    }
}
