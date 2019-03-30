import QtQuick 2.7
import "Global"

Rectangle {
    id: page
    Component {
        id: walletlistviewDelegate
        Item {
            id: recipe

            width: listView.width
            height: lineHeight * 3 + scaledMargin / 2

            MouseArea {
                id: mousearea
                anchors.fill: parent
                onClicked: {
                }
            }
            Rectangle
            {
                height: parent.height - scaledMargin / 2
                width: parent.width - 20
                anchors.centerIn: parent
                border.width: 1
//                radius: 5
                border.color: Variables.borderColor
                color: Variables.sectionColor
                Rectangle{
                    id: infoRect
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: scaledMargin
                    width: parent.width - height / 2 - scaledMargin
                    color: "transparent"
                    Rectangle{
                        id: firstLine
                        width: parent.width
                        height: lineHeight
                        color: "transparent"
                        Text{
                            id: txtName
                            text: "Name: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
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
                            id: txtType
                            text: "Type: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtNameContent.right
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
                            id: txtMake
                            text: "Make: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtTypeContent.right
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
                            id: txtTransactionId
                            text: "Transaction ID: "
                            color: Variables.textColor_1
                            font.pixelSize: fontSize / 1.2
//                            width: contWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                        }
                        Text{
                            id: txtTransactionIdContent
                            text: wtransactionId
                            color: Variables.textColor
                            font.pixelSize: fontSize
                            width: textWidth
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: txtTransactionId.right
                            anchors.leftMargin: scaledMargin * 2
                        }
                    }
                }
                ImageButton{
                    id: btnVisa
                    anchors.right: parent.right
                    anchors.rightMargin: scaledMargin
                    anchors.verticalCenter: parent.verticalCenter
                    height: infoRect.height / 2.5
                    width: height
                    imgPath: Variables.darkModeOn === "1" ? "Images/arrowright_white.png" : "Images/arrowright_black.png"
                    color: "transparent"
                    selected: true
                    onClicked: {
                        manageClaimsFrame2.setInfo(index)
                        manageClaimSwipeView.currentIndex = 1
                        menuView.currentIndex = 1
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
        model: walletModel
        delegate: walletlistviewDelegate
    }
    PScrollBar {
        id: scrollbar
        flickable: listView;
    }
}
