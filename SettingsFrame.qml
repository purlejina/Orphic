import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Item {
    id: settingsBox
    anchors.fill: parent
    Rectangle {
        id: innerSettings
        anchors.fill: parent
        color: Variables.backgroundColor
        Rectangle {
            id: peerHeader
            anchors.top: parent.top
            anchors.topMargin: 60
            height: 40
            width: parent.width/4
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 10
            //anchors.rightMargin: 20
            color: Variables.backgroundColor
            Text {
                id: peerHeaderText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: 15
                text: "Allow Peer Communication"
                color: Variables.textColor
            }
        }
        Rectangle {
            id: peerSwitch
            anchors.top: peerHeader.bottom
            anchors.topMargin: 5
            height: 30
            width: 80
            anchors.horizontalCenter: peerHeader.horizontalCenter
            color: Variables.backgroundColor
            CustomSwitch {
            }
        }
        Rectangle {
            id: peerSwitchText
            anchors.top: peerSwitch.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: peerSwitch.horizontalCenter
            height: 40
            width: peerHeader.width
            color: Variables.backgroundColor
            Text {
                id: psText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: 11
                text: "Peer to Peer Communication System tttttttttttttttttttttttttttttttttttt"
                color: Variables.textColor
            }
        }
        Rectangle {
            id: darkHeader
            anchors.top: peerSwitchText.bottom
            anchors.topMargin: 60
            width: peerHeader.width
            height: 40
            anchors.horizontalCenter: peerHeader.horizontalCenter
            color: Variables.backgroundColor
            Text {
                id: dhText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: 15
                text: "Dark Mode"
                color: Variables.textColor
            }
        }
        Rectangle {
            id: darkSwitch
            anchors.top: darkHeader.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: darkHeader.horizontalCenter
            height: 30
            width: 80
            color: Variables.backgroundColor
            CustomSwitch {
                id: darkMode
                checked: false
                onCheckedChanged: {
                    if(darkMode.checked === true){
                        Variables.darkModeOn = "0"
                    }
                    else {
                        Variables.darkModeOn = "1"
                    }
                    Variables.darkMode()
                }
            }
        }
        Rectangle {
            id: darkSwitchText
            anchors.top: darkSwitch.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: darkSwitch.horizontalCenter
            height: 40
            width: darkHeader.width
            color: Variables.backgroundColor
            Text {
                id: dsText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: 11
                text: "Activates the Dark Mode Setting ........................"
                color: Variables.textColor
            }
        }
        Rectangle {
            id: ledgerHeader
            anchors.top: parent.top
            anchors.topMargin: 60
            height: 40
            width: peerHeader.width
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 10
            color: Variables.backgroundColor
            Text {
                id: lhText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: 15
                text: "Keep Copy of Ledger"
                color: Variables.textColor
            }
        }
        Rectangle {
            id: ledgerSwitch
            anchors.top: ledgerHeader.bottom
            anchors.topMargin: 5
            height: 30
            width: 80
            anchors.horizontalCenter: ledgerHeader.horizontalCenter
            color: Variables.backgroundColor
            CustomSwitch {
            }
        }
        Rectangle {
            id: ledgerText
            anchors.top: ledgerSwitch.bottom
            anchors.topMargin: 5
            height : 40
            width: ledgerHeader.width
            anchors.horizontalCenter: ledgerSwitch.horizontalCenter
            color: Variables.backgroundColor
            Text {
                id: lsText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: 11
                text: "Keep a Copy of the Ledger ............................."
                color: Variables.textColor
            }
        }
        Rectangle {
            id: helpButton
            anchors.top: darkSwitch.top
            anchors.horizontalCenter: ledgerHeader.horizontalCenter
            width: 100
            height: 30
            color: Variables.backgroundColor
            CustomButton {
                id: button
                buttonText: "Help"
            }
        }
        Rectangle {
            id: helpButtonText
            anchors.top: helpButton.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: helpButton.horizontalCenter
            height: 40
            width: ledgerHeader.width
            color: Variables.backgroundColor
            Text {
                id: hbText
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: 11
                text: "Find help at orphicguard.com"
                color: Variables.textColor
            }
        }
    }
}
