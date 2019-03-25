import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

Item {
    id:recieveClaimBox
    anchors.fill: parent
    Rectangle {
        id: receive
        anchors.fill: parent
        color: Variables.backgroundColor
        Rectangle {
            id: header
            anchors.top: parent.top
            anchors.topMargin: 10
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            color: Variables.backgroundColor
            Text {
                id: headerText
                anchors.fill: parent
                text: "Give this address to the transferer"
                font.pointSize: 11
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                color: Variables.textColor
            }
        }
        TextField {
            id: address
            anchors.top: header.bottom
            anchors.topMargin: 20
            height: 30
            readOnly: true
            text: "Address *testing"
            width: parent.width / 2 + 40
            anchors.horizontalCenter: parent.horizontalCenter
            style: TextFieldStyle {
                textColor: Variables.textColor
                placeholderTextColor: Variables.textColor
                background: Rectangle {
                    color: Variables.buttonColor
                    border.color: "black"
                    border.width: 1
                }
            }
        }
        Rectangle {
            id: headerTwo
            anchors.top: address.bottom
            anchors.topMargin: 50
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            color: Variables.backgroundColor
            Text {
                id: headerTwoText
                anchors.fill: parent
                text: "Enter key you received from transferer"
                font.pointSize: 11
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                color: Variables.textColor
            }
        }
        TextField {
            id: receiveKey
            anchors.top: headerTwo.bottom
            anchors.topMargin: 20
            height: 30
            placeholderText: "Receive Key"
            width: address.width
            anchors.horizontalCenter: parent.horizontalCenter
            style: TextFieldStyle {
                textColor: Variables.textColor
                placeholderTextColor: Variables.textColor
                background: Rectangle {
                    color: Variables.buttonColor
                    border.color: "black"
                    border.width: 1
                }
            }
        }
        Rectangle{
            id: goButton
            anchors.top: receiveKey.bottom
            anchors.topMargin: 20
            width: 200
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            color: Variables.backgroundColor
            CustomButton{
                id: gButton
                buttonText: "Go"
                onClicked: {
                    bar.currentIndex = 0
                    console.log("*testing") // send input to wallet/display in wallet info
                }
            }
        }
    }
}
