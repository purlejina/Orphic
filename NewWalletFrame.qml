import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

Rectangle {
    id:newWalletBox
    anchors.fill:parent
    color: Variables.backgroundColor
    property bool bCreated: false
    Rectangle {
       id: rectangle
       width: parent.width
       height: childrenRect.height
       anchors.verticalCenter: parent.verticalCenter
       color: "transparent"
       Text{
           id: headerText
           font.pixelSize: fontSize
           anchors.top: parent.top
           anchors.topMargin: scaledMargin
           width: parent.width - scaledMargin * 5
           anchors.horizontalCenter: parent.horizontalCenter
           wrapMode: Text.WordWrap
           horizontalAlignment: Text.AlignHCenter
           text: "Make a name and a <b><font color='red'>strong password </font></b> for your new wallet. You will <b><font color='red'>not</font></b> be able to change them later."
           color: Variables.textColor
       }

       WTextField {
           id: name
           placeholderText: "Name"
           anchors.top: headerText.bottom
           anchors.topMargin: scaledMargin * 3.5
           anchors.horizontalCenter: parent.horizontalCenter
           height: 30
           width: Math.min(parent.width / 2, 350)
           font.pixelSize: fontSize / 1.1
       }
       WTextField {
           id: password
           anchors.top: name.bottom
           anchors.topMargin: scaledMargin * 2
           height: name.height
           width: name.width
           placeholderText: "Password"
           anchors.horizontalCenter: parent.horizontalCenter
           echoMode: TextInput.Password
           font.pixelSize: fontSize / 1.1
       }
       Text {
           id: pmessage
           anchors.top: password.bottom
           anchors.topMargin: scaledMargin
           anchors.right: password.right
           wrapMode: Text.Wrap
           color: "red"
           horizontalAlignment: Text.AlignRight
           font.pixelSize: fontSize / 1.2
           text: "Password must be at least 16 characters"
           visible: password.text.length < 16 ? true : false
       }
       WTextField {
           id: retype
           anchors.top: pmessage.bottom
           anchors.topMargin: scaledMargin
           anchors.horizontalCenter: parent.horizontalCenter
           height: name.height
           width: name.width
           placeholderText: "Re-Enter Password"
           echoMode: TextInput.Password
           font.pixelSize: fontSize / 1.1
       }
       Text {
           id: rmessage
           anchors.top: retype.bottom
           anchors.topMargin: scaledMargin
           anchors.right: retype.right
           wrapMode: Text.Wrap
           color: "red"
           horizontalAlignment: Text.AlignRight
           font.pixelSize: fontSize / 1.2
           text: {
               "Those passwords didn't match. Try again."
               // needs to be Password does not match
               //utility.messageOne()
               //utility.getFirstMessage()
           }
           visible: password.text != retype.text ? true : false
       }

       WCheckBox {
           id: showPassword
           anchors.left: retype.left
           anchors.top: rmessage.bottom
           anchors.topMargin: scaledMargin / 2
           text: "Show Password"
           onCheckedChanged: {
               if (showPassword.checked === false) {
                   password.echoMode = TextInput.Password
                   retype.echoMode = TextInput.Password
               } else {
                   password.echoMode = TextInput.Normal
                   retype.echoMode = TextInput.Normal
               }
           }
       }

       TextButton{
           id: createButton
           anchors.top: showPassword.bottom
           anchors.topMargin: scaledMargin
           anchors.horizontalCenter: parent.horizontalCenter
           text: "Create Wallet"
           width: retype.width
           selected: true
           enabled: name.text != "" && password.text.length >= 16 && password.text === retype.text ? true : false
           onClicked: {
               utility.newWallet(name.text, password.text, false)
               createMessage.text = utility.getFirstMessage()
               secretOutput.text = utility.getSecretOutput()
               bCreated = true
               name.text = ""
               password.text = ""
               retype.text = ""
           }
       }

       Text{
           id: createMessage
           anchors.top: createButton.bottom
           anchors.topMargin:scaledMargin
           font.pixelSize: fontSize / 1.2
           width: createButton.width
           wrapMode: Text.WordWrap
           horizontalAlignment: Text.AlignLeft
           anchors.horizontalCenter: parent.horizontalCenter
           color: Variables.textColor
       }
       Text{
           id: secretOutput
           anchors.top: createMessage.bottom
           anchors.topMargin: scaledMargin
           horizontalAlignment: Text.AlignLeft
           width: createButton.width
           anchors.horizontalCenter: parent.horizontalCenter
           font.pixelSize: fontSize / 1.2
           color: Variables.textColor
       }
       TextButton{
           id:saveButton
           text: "Save Wallet"
           anchors.top: secretOutput.bottom
           anchors.topMargin: scaledMargin
           anchors.horizontalCenter: parent.horizontalCenter
           width: retype.width
           selected: true
           enabled: bCreated === true ? true : false
           onClicked: {
               //tells c++ to save wallet
               utility.newWallet(name.text, password.text, true)
               gotoPage(0, 0)
               bCreated = false
           }
       }
   }
}

