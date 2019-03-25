import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Global"

Rectangle {
    id: rectangle
    color: Variables.backgroundColor
    anchors.fill: parent
    property int itemW: Math.min(parent.width / 3.5, 350)

    Text {
        id: headerText
        font.pixelSize: fontSize
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 2.5
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Payment"
        color: Variables.textColor
    }

    Rectangle{
        id: infoRect
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: scaledMargin * 3.5
        anchors.rightMargin: scaledMargin * 3.5
        anchors.top: headerText.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.bottom: btnPrevious.top
        anchors.bottomMargin: scaledMargin * 2

        Rectangle{
            id: creditRect
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.leftMargin: scaledMargin * 3.5
            anchors.rightMargin: scaledMargin * 2
            anchors.verticalCenter: parent.verticalCenter
            height: childrenRect.height
            color: "transparent"
            Text{
                id: txtCreditCard
                font.pixelSize: fontSize / 1.2
                anchors.top: parent.top
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
                text: "Credit/Debit Card"
            }
            Rectangle{
                id: rectBtnCredit
                anchors.left: parent.left
                width: parent.width
                anchors.top: txtCreditCard.bottom
                anchors.topMargin: scaledMargin
                height: itemHeight * 2
                color: "transparent"
                ImageButton{
                    id: btnVisa
                    height: parent.height
                    width: Math.min(itemWidth / 2, (parent.width - scaledMargin) / 4)
                    imgPath: "Images/visa.png"
                    anchors.left: parent.left
                    onClicked: {
                        btnVisa.selected = true
                        btnMasterCard.selected = false
                        btnDiscover.selected = false
                        btnExpress.selected = false
                    }

                }
                ImageButton{
                    id: btnMasterCard
                    height: btnVisa.height
                    width: btnVisa.width
                    imgPath: "Images/mastercard.png"
                    anchors.left: btnVisa.right
                    anchors.leftMargin: scaledMargin / 5
                    onClicked: {
                        btnVisa.selected = false
                        btnMasterCard.selected = true
                        btnDiscover.selected = false
                        btnExpress.selected = false
                    }

                }
                ImageButton{
                    id: btnDiscover
                    height: btnVisa.height
                    width: btnVisa.width
                    imgPath: "Images/discover.png"
                    anchors.left: btnMasterCard.right
                    anchors.leftMargin: scaledMargin / 5
                    onClicked: {
                        btnVisa.selected = false
                        btnMasterCard.selected = false
                        btnDiscover.selected = true
                        btnExpress.selected = false
                    }

                }
                ImageButton{
                    id: btnExpress
                    height: btnVisa.height
                    width: btnVisa.width
                    imgPath: "Images/express.png"
                    anchors.left: btnDiscover.right
                    anchors.leftMargin: scaledMargin / 5
                    onClicked: {
                        btnVisa.selected = false
                        btnMasterCard.selected = false
                        btnDiscover.selected = false
                        btnExpress.selected = true
                    }

                }
            }
            WTextField {
                id: txtCardNumber
                anchors.left: parent.left
                anchors.top: rectBtnCredit.bottom
                anchors.topMargin: scaledMargin * 2
                width: itemW
                height: 30
                placeholderText: "Card Number"
                font.pixelSize: fontSize / 1.1

            }
            WTextField {
                id: txtCsv
                anchors.left: parent.left
                anchors.top: txtCardNumber.bottom
                anchors.topMargin: scaledMargin * 2
                width: itemW
                height: 30
                placeholderText: "CSV"
                font.pixelSize: fontSize / 1.1

            }
            WTextField {
                id: txtExpDate
                anchors.left: parent.left
                anchors.top: txtCsv.bottom
                anchors.topMargin: scaledMargin * 2
                width: itemW
                height: 30
                placeholderText: "Exp. Date 2019/03/23"
                font.pixelSize: fontSize / 1.1

            }
            Text{
                id: txtTotal
                anchors.top: txtExpDate.bottom
                anchors.topMargin: scaledMargin * 2
                height: itemHeight / 1.5
                text: "Total: $" + utility.getTotalBalance()
            }
        }
        Rectangle{
            id: bitcoinRect
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            anchors.rightMargin: scaledMargin * 3.5
            anchors.leftMargin: scaledMargin * 2
            anchors.verticalCenter: parent.verticalCenter
            height: creditRect.height
            color: "transparent"
            Text{
                id: txtBitcoin
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: parent.top
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
                text: "Bitcoin"
            }

            WTextField {
                id: txtBitcoinAddress
                anchors.left: parent.left
                anchors.top: txtBitcoin.bottom
                anchors.topMargin: scaledMargin * 2
                width: itemW
                height: 30
                placeholderText: "Exp. Date 2019/03/23"
                font.pixelSize: fontSize / 1.1

            }
            Image{
                id: qrImage
                anchors.top: txtBitcoinAddress.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.bottom: txtBitcoinWarning.top
                anchors.bottomMargin: scaledMargin * 2
                width: itemW / 2
            }
            Text{
                id: txtBitcoinWarning
                anchors.bottom: txtTotalBitcoin.top
                anchors.bottomMargin: scaledMargin * 2
                text: "Send Bitcoin to this Address"
            }
            Text{
                id: txtTotalBitcoin
                anchors.bottom: parent.bottom
                text: "Total: B" + utility.getTotalBitcoin()
            }
        }
    }
    TextButton{
        id: btnPrevious
        anchors.bottom: parent.bottom
        anchors.bottomMargin: itemHeight / 1.5 + scaledMargin * 2
        anchors.right: btnContinue.left
        anchors.rightMargin: scaledMargin
        text: "Previous"
        selected: true
        height: itemHeight
        widthRate: 2
        onClicked: {
            newClaimSwipeView.currentIndex = newClaimSwipeView.currentIndex - 1
        }
    }
    TextButton{
        id: btnContinue
        anchors.bottom: parent.bottom
        anchors.bottomMargin: itemHeight / 1.5 + scaledMargin * 2
        anchors.right: parent.right
        anchors.rightMargin: scaledMargin * 3.5
        text: "Continue"
        selected: true
        height: itemHeight
        widthRate: 2
        onClicked: {
            utility.doPayment(txtCardNumber.text, txtCsv.text, txtExpDate.text)
            newClaimSwipeView.currentIndex = newClaimSwipeView.currentIndex + 1
        }
    }

}
