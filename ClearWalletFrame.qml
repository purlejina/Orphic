import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

Rectangle {
    id:clearWalletBox
    anchors.fill:parent
    color: Variables.backgroundColor
    property int itemW: Math.min(parent.width / 2.5, 350)
    Rectangle {
        id: rectangle
        width: parent.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Text {
            id: headerText
            font.pixelSize: fontSize
            anchors.top: parent.top
            anchors.topMargin: scaledMargin
            width: parent.width - scaledMargin * 5
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: "This will delete the wallet data stored on this computer but <b><font color='red'>not</b></font> on the blockchain."
            color: Variables.textColor
        }
        WTextField {
            id: password
            anchors.top: headerText.bottom
            anchors.topMargin: scaledMargin * 3.5
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            width: itemW
            placeholderText: "Enter Password"
            onTextChanged: {
                incorrectText.visible = false
            }
        }
        Text {
            id: incorrectText
            anchors.top: password.bottom
            anchors.topMargin: scaledMargin
            anchors.right: password.right
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignRight
            font.pixelSize: fontSize / 1.2
            color: "red"
            text: "Password incorrect *testing"
            visible: false
        }
        TextButton
        {
            id: clearButton
            anchors.top: incorrectText.bottom
            anchors.topMargin: scaledMargin * 2
            anchors.horizontalCenter: parent.horizontalCenter
            width: itemW
            text: "Clear"
            selected: true
            onClicked: {
                if (utility.clearWallet(password.text) === false)
                {
                    incorrectText.visible = true
                    return;
                }
                gotoPage(0, 0)
            }
        }
    }
}
