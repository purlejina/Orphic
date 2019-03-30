import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

Rectangle {
    id:recieveClaimBox
    anchors.fill: parent
    color: Variables.backgroundColor
    property int itemW: Math.min(parent.width / 2.5, 350)
    Rectangle {
        id: receive
        width: parent.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Text {
            id: headerText
            anchors.top: parent.top
            text: "Give this address to the transferer"
//            width: parent.width - scaledMargin * 5
            font.pointSize: fontSize / 1.1
            wrapMode: Text.WordWrap
//            horizontalAlignment: Text.AlignHCenter
//            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: address.left
            color: Variables.textColor
        }
        WTextField {
            id: address
            anchors.top: headerText.bottom
            anchors.topMargin: scaledMargin * 2
            height: 30
            readOnly: true
            placeholderText: "256 character String Output"
            width: itemW
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: headerTwoText
            anchors.top: address.bottom
            anchors.topMargin: scaledMargin * 3.7
            text: "Enter key you received from transferer"
//            width: parent.width - scaledMargin * 5
            font.pointSize: fontSize / 1.1
            wrapMode: Text.WordWrap
//            horizontalAlignment: Text.AlignHCenter
//            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: address.left
            color: Variables.textColor
        }
        WTextField {
            id: receiveKey
            anchors.top: headerTwoText.bottom
            anchors.topMargin: scaledMargin * 2
            height: 30
            placeholderText: "256 character String Input"
            width: address.width
            anchors.horizontalCenter: parent.horizontalCenter
            onTextChanged: {
                txtReceiveKeyWrong.visible = false
            }
        }
        Text {
            id: txtReceiveKeyWrong
            anchors.top: receiveKey.bottom
            anchors.topMargin: scaledMargin
            anchors.right: receiveKey.right
            horizontalAlignment: Text.AlignRight
            color: "red"
            text: "*Receive Key may be incorrect."
            font.pixelSize: fontSize / 1.2
            wrapMode: Text.WordWrap
            visible: false
        }

        TextButton{
            id: btnGo
            anchors.top: receiveKey.bottom
            anchors.topMargin: scaledMargin * 3.7
            anchors.horizontalCenter: parent.horizontalCenter
            width: address.width
            text: "Go"
            selected: true
            onClicked: {
                if (utility.receiveClaim_step2(receiveKey.text) === false)
                {
                    txtReceiveKeyWrong.visible = true
                    return
                }
                receiveClaimSwipeView.currentIndex = 1
            }
        }
    }
    function setReceiveAddress()
    {
        address.text = utility.receiveClaim_step1()
    }
}
