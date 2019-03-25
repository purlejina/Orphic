import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Rectangle{
    id: leftMenu
    color: Variables.columnColor
    property bool isWalletOpen: false
    Rectangle {
        id: leftMenuColumn
        width: parent.width - scaledMargin
        height: childrenRect.height
        anchors.centerIn: parent
        color: "transparent"
        TextButton{
            id: wButton
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: itemHeight
            text: "Wallet"
            selected: true
            onClicked: {
                gotoPage(0, 0)
            }
        }
        Rectangle{
            id: walletSubMenu
            anchors.left: parent.left
            anchors.leftMargin: scaledMargin
            anchors.right: parent.right
            height: childrenRect.height
            anchors.top: wButton.bottom
            anchors.topMargin: scaledMargin * 1.5
            color: "transparent"
            TextButton{
                id: btnWalletInfo
                text: "Wallet Info"
                width: parent.width
                anchors.top: parent.top
                selected: true
                height: itemHeight
                onClicked: {
                    gotoPage(0, 0)
                }
            }
            TextButton{
                id: btnNewClaim
                text: "New Claim"
                width: parent.width
                anchors.top: btnWalletInfo.bottom
                anchors.topMargin: scaledMargin
                height: itemHeight
                enabled: isWalletOpen
                onClicked: {
                    gotoPage(0, 1)
                }
            }
            TextButton{
                id: btnReceiveClaim
                text: "Receive Claim"
                width: parent.width
                anchors.top: btnNewClaim.bottom
                anchors.topMargin: scaledMargin
                height: itemHeight
                enabled: isWalletOpen
                onClicked: {
                    gotoPage(0, 2)
                }
            }

            TextButton{
                id: btnManageClaim
                text: "Manage Claims"
                width: parent.width
                anchors.top: btnReceiveClaim.bottom
                anchors.topMargin: scaledMargin
                height: itemHeight
                enabled: isWalletOpen
                onClicked: {
                    gotoPage(0, 3)
                }
            }

            TextButton{
                id: btnSearch
                text: "Search"
                width: parent.width
                anchors.top: btnManageClaim.bottom
                anchors.topMargin: scaledMargin
                height: itemHeight
                enabled: isWalletOpen
                onClicked: {
                    gotoPage(0, 4)
                }
            }

            TextButton{
                id: btnSettings
                text: "Settings"
                width: parent.width
                anchors.top: btnSearch.bottom
                anchors.topMargin: scaledMargin
                height: itemHeight
                onClicked: {
                    gotoPage(0, 5)
                }
            }

        }

        TextButton{
            id: nwButton
            text: "New Wallet"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: walletSubMenu.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                gotoPage(1, 0)
            }
        }

        TextButton
        {
            id: lwButton
            text: "Open Wallet"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: nwButton.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                gotoPage(2, 0)
            }
        }

        TextButton{
            id: closewButton
            text: "Close Wallet"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: lwButton.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                utility.closeWallet()
                gotoPage(0, 0)
                isWalletOpen = false
            }
        }

        TextButton{
            id: clearwButton
            text: "Clear Wallet"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: closewButton.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                gotoPage(3, 0)
            }
        }
    }
    function gotoPage(largeIdx, smallIdx)
    {
        mainStackView.currentIndex = largeIdx
        if (largeIdx === 0)
        {
            walletStackView.currentIndex = smallIdx
            btnWalletInfo.selected = smallIdx === 0 ? true : false
            btnNewClaim.selected = smallIdx === 1 ? true : false
            btnReceiveClaim.selected = smallIdx === 2 ? true : false
            btnManageClaim.selected = smallIdx === 3 ? true : false
            btnSearch.selected = smallIdx === 4 ? true : false
            btnSettings.selected = smallIdx === 5 ? true : false
        }
        wButton.selected = largeIdx === 0 ? true : false
        nwButton.selected = largeIdx === 1 ? true : false
        lwButton.selected = largeIdx === 2 ? true : false
        clearwButton.selected = largeIdx === 3 ? true : false
    }
}

