import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Item {
    id:walletItem
    onVisibleChanged: {
        mainStackView.push(walletInfoFrame)
        wButton.selected = true
        nwButton.selected = false
        lwButton.selected = false
        closewButton.selected = false
        clearwButton.selected = false
        wButton.state = "Selected"
        nwButton.state = ""
        lwButton.state = ""
        closewButton.state = ""
        clearwButton.state = ""
    }
//    ColumnLayout {
    Rectangle{
        id: leftMenu
        anchors.left: parent.left
        width: Math.max(Math.min(parent.width / 5, leftMenuMaxWidth), leftMenuMinWidth)
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: Variables.columnColor
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
                    mainStackView.push(walletInfoFrame)
                    selected = true
                    //wiButton.selected = false
                    nwButton.selected = false
                    lwButton.selected = false
                    closewButton.selected = false
                    clearwButton.selected = false
                    //wiButton.state = ""
                    nwButton.state = ""
                    lwButton.state = ""
                    closewButton.state = ""
                    clearwButton.state = ""
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
                }
                TextButton{
                    id: btnNewClaim
                    text: "New Claim"
                    width: parent.width
                    anchors.top: btnWalletInfo.bottom
                    anchors.topMargin: scaledMargin
                    height: itemHeight
                }
                TextButton{
                    id: btnReceiveClaim
                    text: "Receive Claim"
                    width: parent.width
                    anchors.top: btnNewClaim.bottom
                    anchors.topMargin: scaledMargin
                    height: itemHeight
                }

                TextButton{
                    id: btnManageClaim
                    text: "Manage Claims"
                    width: parent.width
                    anchors.top: btnReceiveClaim.bottom
                    anchors.topMargin: scaledMargin
                    height: itemHeight
                }

                TextButton{
                    id: btnSearch
                    text: "Search"
                    width: parent.width
                    anchors.top: btnManageClaim.bottom
                    anchors.topMargin: scaledMargin
                    height: itemHeight
                }

                TextButton{
                    id: btnSettings
                    text: "Settings"
                    width: parent.width
                    anchors.top: btnSearch.bottom
                    anchors.topMargin: scaledMargin
                    height: itemHeight
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
                    mainStackView.push(newWalletFrame)
                    selected = true
                    wButton.selected = false
                    //nwButton.selected = false
                    lwButton.selected = false
                    closewButton.selected = false
                    clearwButton.selected = false
                    wButton.state = ""
                    //nwButton.state = ""
                    lwButton.state = ""
                    closewButton.state = ""
                    clearwButton.state = ""
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
                    mainStackView.push(loadWalletFrame)
                    selected = true
                    wButton.selected = false
                    nwButton.selected = false
                    //lwButton.selected = false
                    closewButton.selected = false
                    clearwButton.selected = false
                    wButton.state = ""
                    nwButton.state = ""
                    //lwButton.state = ""
                    closewButton.state = ""
                    clearwButton.state = ""
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
                    mainStackView.push(walletInfoFrame)
                    wButton.selected = true
                    nwButton.selected = false
                    lwButton.selected = false
                    //closewButton.selected = false
                    clearwButton.selected = false
                    wButton.state = "Selected"
                    nwButton.state = ""
                    lwButton.state = ""
                    //closewButton.state = ""
                    clearwButton.state = ""
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
                    mainStackView.push(clearWalletFrame)
                    selected = true
                    wButton.selected = false
                    nwButton.selected = false
                    lwButton.selected = false
                    closewButton.selected = false
                    //clearwButton.selected = false
                    wButton.state = ""
                    nwButton.state = ""
                    lwButton.state = ""
                    closewButton.state = ""
                    //clearwButton.state = ""
                }
            }

        }
    }

    StackView {
        id: mainStackView
        anchors.right: parent.right
        anchors.left: leftMenu.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        initialItem: walletInfoFrame
        onWindowChanged: mainStackView.initialItem = walletInfoFrame
        Component {
            id: walletInfoFrame
            WalletInfoFrame {
            }
        }
        Component {
            id: newWalletFrame
            NewWalletFrame {
            }
        }
        Component {
            id: loadWalletFrame
            LoadWalletFrame {
            }
        }
        Component {
            id: clearWalletFrame
            ClearWalletFrame {
            }
        }
    }
}
