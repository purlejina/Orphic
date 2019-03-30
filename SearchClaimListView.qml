import QtQuick 2.7
import "Global"

Rectangle {
    id: page
    Component {
        id: walletlistviewDelegate
        Item {
            id: recipe

            width: listView.width
            height: lineHeight * 4 + scaledMargin / 2

            MouseArea {
                id: mousearea
                anchors.fill: parent
                onClicked: {
                    walletMoreInfoPage.setInfo(index, true)
                    dlgMoreInformation.open()
                }
            }
            Rectangle
            {
                height: parent.height - scaledMargin / 2
                width: parent.width - 20
                anchors.centerIn: parent
                border.width: 1
                border.color: "black"
                color: mousearea.pressed ? "#d6d6d6" : "#f6f6f6"
                Rectangle{
                    id: infoRect
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: scaledMargin
                    width: parent.width - height - scaledMargin
                    color: "transparent"
                    Rectangle{
                        id: firstLine
                        width: parent.width
                        height: lineHeight
                        color: "transparent"
                        Text{
                            id: txtType
                            text: "Type: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Text{
                            id: txtTypeContent
                            text: wtype
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtType.right
                        }

                        Text{
                            id: txtName
                            text: "Name: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtTypeContent.right
                        }
                        Text{
                            id: txtNameContent
                            text: wname
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtName.right
                        }
                        Text{
                            id: txtMake
                            text: "Make: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtNameContent.right
                        }
                        Text{
                            id: txtMakeContent
                            text: wmake
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtMake.right
                        }
                    }
                    Rectangle{
                        id: secondLine
                        anchors.top: firstLine.bottom
                        width: parent.width
                        height: lineHeight
                        color: "transparent"
                        Text{
                            id: txtModel
                            text: "Model: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Text{
                            id: txtModelContent
                            text: wmodel
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtModel.right
                        }
                        Text{
                            id: txtYear
                            text: "Year: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtModelContent.right
                        }
                        Text{
                            id: txtYearContent
                            text: wyear
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtYear.right
                        }
                        Text{
                            id: txtSerial
                            text: "Serial: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtYearContent.right
                        }
                        Text{
                            id: txtSerialContent
                            text: wserial
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtSerial.right
                        }
                    }
                    Rectangle{
                        id: thirdLine
                        anchors.top: secondLine.bottom
                        width: parent.width
                        height: lineHeight
                        color: "transparent"
                        Text{
                            id: txtOther
                            text: "Other: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Text{
                            id: txtOtherContent
                            text: wother
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtOther.right
                        }
                    }
                }
                Rectangle{
                    anchors.right: parent.right
                    height: infoRect.height
                    width: height
                    color: "transparent"
                    Image{
                        width: parent.width / 1.2
                        height: parent.height / 1.2
                        anchors.centerIn: parent
                        source: wpicture
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
        model: searchClaimModel
        delegate: walletlistviewDelegate
    }
    PScrollBar {
        id: scrollbar
        flickable: listView;
    }
}
