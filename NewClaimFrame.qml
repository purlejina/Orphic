import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

import "Global"

Rectangle {
    id:newClaimBox
    anchors.fill:parent
    color: Variables.backgroundColor
    property int itemW: Math.min(parent.width / 3.7, 270)
    Rectangle {
        id: rectangle
        width: parent.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Text {
            id: headerText
            font.pixelSize: fontSize
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: scaledMargin
            width: parent.width - scaledMargin * 5
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: utility.getWalletName()
            color: Variables.textColor
        }
        Rectangle{
            id: leftRect
            anchors.top: headerText.bottom
            anchors.topMargin: scaledMargin * 3.5
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: scaledMargin * 2
            width: itemW
            height: childrenRect.height
            color: "transparent"
            WCombobox {
                id: cmbType
                currentIndex: 0
                width: parent.width
                anchors.top: parent.top
                height: 30
                // this should not be hard coded. list will come from c++ back end
                model: ListModel {
                    id: model
                    ListElement { text: "No Type Selected" }
                    ListElement { text: "Art" }
                    ListElement { text: "Bicycle" }
                    ListElement { text: "Electronic" }
                    ListElement { text: "Firearm" }
                    ListElement { text: "OHV" }
                    ListElement { text: "Other" }
                    ListElement { text: "Tool" }
                }
            }
            WTextField {
                id: txtName
                anchors.top: cmbType.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width
                height: cmbType.height
                placeholderText: "Name"
                font.pixelSize: fontSize / 1.1
            }
            WTextField {
                id: txtMake
                anchors.top: txtName.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width
                height: cmbType.height
                placeholderText: "Make"
                font.pixelSize: fontSize / 1.1
            }
            WTextField {
                id: txtModel
                anchors.top: txtMake.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width
                height: cmbType.height
                placeholderText: "Model"
                font.pixelSize: fontSize / 1.1
            }

            WTextField {
                id: txtYear
                anchors.top: txtModel.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width
                height: cmbType.height
                placeholderText: "Year"
                font.pixelSize: fontSize / 1.1
            }
            WTextField {
                id: txtSerial
                anchors.top: txtYear.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width
                height: cmbType.height
                placeholderText: "Serial Number"
                font.pixelSize: fontSize / 1.1
            }
            WTextField {
                id: txtOther
                anchors.top: txtSerial.bottom
                anchors.topMargin: scaledMargin * 2
                width: parent.width
                height: cmbType.height
                placeholderText: "Other ID"
                font.pixelSize: fontSize / 1.1
            }
        }
        Rectangle{
            id: rightRect
            anchors.top: headerText.bottom
            anchors.topMargin: scaledMargin * 3.5
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: scaledMargin * 2
            width: itemW
            height: leftRect.height
            color: "transparent"
            WTextArea {
                id: txtDescription
                anchors.top: parent.top
                anchors.bottom: btnAddDoc.top
                anchors.bottomMargin: scaledMargin * 2
                width: parent.width
                placeholderText: "Description"
                font.pixelSize: fontSize / 1.1
            }
            TextButton{
                id: btnAddDoc
                anchors.bottom: txtFileName.top
                anchors.bottomMargin: scaledMargin
                text: "Add Documents"
                selected: true
                widthRate: 1.5
                height: 30
                width: parent.width
                onClicked: {
                    fileDialog.open()
                }
            }
            Text {
                id: txtFileName
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                horizontalAlignment: Text.AlignLeft
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                wrapMode: Text.WordWrap
                text: "No file selected"
            }
        }
        TextButton{
            id: btnNext
            anchors.top: rightRect.bottom
            anchors.topMargin: scaledMargin * 2.5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Next"
            width: itemW
            selected: true
            enabled: cmbType.currentIndex != 0 || txtName.text != "" || txtMake.text != "" || txtModel.text != "" || txtYear.text != "" || txtSerial.text != "" || txtOther.text != "" || txtDescription.text != "" || txtFileName.text != "No file selected" ? true : false
            onClicked: {
                utility.newClaim(cmbType.currentText, txtName.text, txtMake.text, txtModel.text, txtYear.text, txtSerial.text, txtOther.text, txtDescription.text, "file:///" + txtFileName.text)
                summaryFrame.setInfo(cmbType.currentText, txtName.text, txtMake.text, txtModel.text, txtYear.text, txtSerial.text, txtOther.text, txtDescription.text, "file:///" + txtFileName.text)
                newClaimSwipeView.currentIndex = 1
            }
        }
    }
    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        nameFilters: [ "Select File (*.*)"]
        visible: false
        onAccepted: {
            txtFileName.text = fileDialog.fileUrl.toString().replace("file:///", "")
        }
        onRejected: {

        }
    }
}
