import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

Rectangle {
    id:loadWalletBox
    anchors.fill:parent
    color: Variables.backgroundColor
    property int itemW: Math.min(parent.width / 3.5, 350)
    Rectangle {
        id: rectangle
        width: parent.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Rectangle {
            id: localWallet
            anchors.top: parent.top
            width: parent.width
            height: childrenRect.height
            color: Variables.backgroundColor
            WCheckBox {
                id: header
                anchors.top: parent.top
                anchors.topMargin: scaledMargin * 2
                text: "Wallets on This Computer"
                anchors.left: wallets.left
                font.pixelSize: fontSize
                checked: true
                onClicked: {
                    header.checked = true
                    headerTwo.checked = false
                    headerThree.checked = false
                }
                onCheckedChanged: {
                    wrongPassword.visible = false
                }
            }

            WCombobox {
                id: wallets
                currentIndex: 0
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: scaledMargin
                anchors.top: header.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width / 3.5
                height: 30
                // this should not be hard coded. list will come from c++ back end
                model: localWalletModel
                enabled: header.checked
                onCurrentIndexChanged: {
                    wrongPassword.visible = false
                }
            }
            WTextField {
                id: password
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: scaledMargin
                anchors.top: header.bottom
                anchors.topMargin: scaledMargin * 2
                width: wallets.width
                height: wallets.height
                placeholderText: "Enter Password"
                echoMode: TextInput.Password
                font.pixelSize: fontSize / 1.1
                enabled: header.checked
                onTextChanged: {
                    wrongPassword.visible = false
                }
            }
            Text {
                id: wrongPassword
                anchors.top: password.bottom
                anchors.topMargin: scaledMargin
                anchors.right: password.right
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignRight
                font.pixelSize: fontSize / 1.2
                color: "red"
                text: "Password Incorrect *testing"
                visible: false
            }
        }
        Rectangle {
            id: externalWallet
            anchors.top: localWallet.bottom
            anchors.topMargin: scaledMargin * 3.5
            width: parent.width
            height: childrenRect.height
            color: Variables.backgroundColor
            WCheckBox {
                id: headerTwo
                anchors.top: parent.top
                text: "Wallets Not on This Computer"
                anchors.left: walletName.left
                font.pixelSize: fontSize
                onClicked: {
                    header.checked = false
                    headerTwo.checked = true
                    headerThree.checked = false
                }
                onCheckedChanged: {
                    notFoundText.visible = false
                }
            }

            WTextField {
                id: walletName
                anchors.top: headerTwo.bottom
                anchors.topMargin: scaledMargin
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: scaledMargin
                width: wallets.width
                height: 30
                placeholderText: "Wallet Name"
                enabled: headerTwo.checked
                onTextChanged: {
                    notFoundText.visible = false
                }
            }
            WTextField {
                id: externalPassword
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: scaledMargin
                anchors.top: headerTwo.bottom
                anchors.topMargin: scaledMargin
                width: wallets.width
                height: 30
                placeholderText: "Enter Password"
                echoMode: TextInput.Password
                enabled: headerTwo.checked
                onTextChanged: {
                    notFoundText.visible = false
                }
            }
            Text {
                id: notFoundText
                anchors.top: externalPassword.bottom
                anchors.topMargin: scaledMargin
                anchors.right: externalPassword.right
                horizontalAlignment: Text.AlignHCenter
                color: "red"
                text: "Could not find wallet. Name and/or password may be incorrect. *testing"
                font.pixelSize: fontSize / 1.2
                wrapMode: Text.WordWrap
                visible: false
            }
        }
        Rectangle {
            id: secretWallet
            anchors.top: externalWallet.bottom
            anchors.topMargin: scaledMargin * 3.5
            implicitWidth: itemW * 2 + scaledMargin * 2
            height: childrenRect.height
            anchors.horizontalCenter: parent.horizontalCenter
            color: Variables.backgroundColor

            WCheckBox {
                id: headerThree
                anchors.top: parent.top
                text: "Wallets From a Secret Key"
                anchors.left: parent.left
                font.pixelSize: fontSize
                onClicked: {
                    header.checked = false
                    headerTwo.checked = false
                    headerThree.checked = true
                }
                onCheckedChanged: {
                    notFoundText2.visible = false
                }
            }

            WTextField {
                id: secretKey
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: headerThree.bottom
                anchors.topMargin: scaledMargin
                width: walletName.width * 2 + scaledMargin * 2
                height: 30
                placeholderText: "Enter Secret Key"
                enabled: headerThree.checked
                onTextChanged: {
                    notFoundText2.visible = false
                }
            }
            Text {
                id: notFoundText2
                anchors.top: secretKey.bottom
                anchors.topMargin: scaledMargin
                anchors.right: secretKey.right
                horizontalAlignment: Text.AlignHCenter
                color: "red"
                text: "Could not find wallet. Key may be incorrect. *testing"
                font.pixelSize: fontSize / 1.2
                wrapMode: Text.WordWrap
                visible: false
            }
        }
        TextButton{
            id:lButton
            anchors.top: secretWallet.bottom
            anchors.topMargin: scaledMargin * 2
            text: "Open Wallet"
            selected: true
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (header.checked)
                {
                    if (utility.loadWallet_fromFile(wallets.currentText, password.text) === false)
                    {
                        wrongPassword.visible = true
                        return
                    }
                }
                else if (headerTwo.checked)
                {
                    if (utility.loadWallet_fromCredentials(walletName.text, externalPassword.text) === false)
                    {
                        notFoundText.visible = true
                        return
                    }
                }
                else if (headerThree.checked)
                {
                    if (utility.loadWallet_fromKey(secretKey.text) === false)
                    {
                        notFoundText2.visible = true
                        return;
                    }
                }
                else
                {
                    return
                }

                gotoPageWithIdx(0, 0)
                mainLeftMenu.isWalletOpen = true
            }
        }
    }
}
