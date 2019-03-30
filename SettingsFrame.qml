import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Item {
    id: settingsBox
    anchors.fill: parent
    property int itemW: Math.min(parent.width / 3.5, 370)
    Rectangle {
        id: innerSettings
        anchors.fill: parent
        color: Variables.backgroundColor
        Rectangle {
            id: peerHeader
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: scaledMargin * 2
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: scaledMargin
            height: childrenRect.height
            width: itemW
            color: Variables.backgroundColor
            Text {
                id: peerHeaderText
//                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: fontSize * 1.1
                text: "Allow Peer Communication"
                color: Variables.textColor
            }
            CustomSwitch {
                id: switchPeerCom
                anchors.top: peerHeaderText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: scaledMargin * 2
            }
            Text {
                id: psText
                anchors.top: switchPeerCom.bottom
                anchors.topMargin: scaledMargin * 2
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: fontSize / 1.1
                text: "Peer to Peer Communication System tttttttttttttttttttttttttttttttttttt"
                color: Variables.textColor
            }
        }

        Rectangle {
            id: darkHeader
            height: childrenRect.height
            width: itemW
            anchors.top: parent.verticalCenter
            anchors.topMargin: scaledMargin * 2
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: scaledMargin
            color: Variables.backgroundColor
            Text {
                id: dhText
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: fontSize * 1.1
                text: "Dark Mode"
                color: Variables.textColor
            }
            CustomSwitch {
                id: darkMode
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: dhText.bottom
                anchors.topMargin: scaledMargin * 2
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
            Text {
                id: dsText
                anchors.top: darkMode.bottom
                anchors.topMargin: scaledMargin * 2
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: fontSize / 1.1
                text: "Activates the Dark Mode Setting ........................"
                color: Variables.textColor
            }
        }

        Rectangle {
            id: ledgerHeader
            width: itemW
            anchors.top: peerHeader.top
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: scaledMargin * 2
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: scaledMargin
            color: Variables.backgroundColor
            Text {
                id: lhText
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: fontSize * 1.1
                text: "Keep Copy of Ledger"
                color: Variables.textColor
            }
            CustomSwitch {
                id: switchLedger
                anchors.top: lhText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: scaledMargin * 2
            }
            Text {
                id: lsText
                anchors.top: switchLedger.bottom
                anchors.topMargin: scaledMargin * 2
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: fontSize / 1.1
                text: "Keep a Copy of the Ledger ............................."
                color: Variables.textColor
            }
        }

        Rectangle {
            id: helpButton
            height: childrenRect.height
            width: itemW
            anchors.top: parent.verticalCenter
            anchors.topMargin: scaledMargin * 2
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: scaledMargin
            color: Variables.backgroundColor
            Text {
                id: txtHelp
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                font.pixelSize: fontSize * 1.1
                text: "Help"
                color: Variables.textColor
                visible: false
            }
            TextButton {
                id: button
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: txtHelp.bottom
                anchors.topMargin: scaledMargin * 2
                text: "Help"
                selected: true
                width: switchLedger.width
                height: switchLedger.height
                onClicked: {
                    Qt.openUrlExternally("https://www.orphicguard.com/")
                }
            }
            Text {
                id: hbText
                anchors.top: button.bottom
                anchors.topMargin: scaledMargin * 2
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                font.pixelSize: fontSize / 1.1
                text: "Find help at orphicguard.com"
                color: Variables.textColor
            }
        }
    }
}
