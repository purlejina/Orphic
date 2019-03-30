import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Global"

Rectangle {
    id: rectangle
    color: Variables.backgroundColor
    anchors.fill: parent
    property int p_idx: -1
    property int itemW: Math.min(parent.width / 4.5, 320)
    Text {
        id: headerText
        font.pixelSize: fontSize
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 2.5
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Report: "
        color: Variables.textColor
    }
    Rectangle{
        id: infoRect
        anchors.top: headerText.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: scaledMargin * 2
        width: parent.width
        color: "transparent"

        Rectangle{
            width: parent.width
            height: childrenRect.height
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            TextButton
            {
                id: btnLost
                anchors.top: parent.top
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: scaledMargin * 2
                width: itemW
                text: "Lost"
                bgColor: Variables.toggleButtonColor
                onClicked: {
                    btnLost.selected = true
                    btnStolen.selected = false
                }
            }

            TextButton
            {
                id: btnStolen
                anchors.top: parent.top
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: scaledMargin * 2
                width: itemW
                text: "Stolen"
                bgColor: Variables.toggleButtonColor
                onClicked: {
                    btnLost.selected = false
                    btnStolen.selected = true
                }
            }

            WTextField {
                id: txtContact
                anchors.left: btnLost.left
                anchors.right: btnStolen.right
                anchors.top: btnLost.bottom
                anchors.topMargin: scaledMargin * 2.5
                height: itemHeight
                placeholderText: "Contact"
                font.pixelSize: fontSize / 1.1
                onTextChanged: {

                }
            }

            TextButton{
                id: btnAddDoc
                anchors.top: txtContact.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.left: txtContact.left
                text: "Add Documents"
                selected: true
                widthRate: 1.5
                height: 30
                onClicked: {
                    fileDialog.open()
                }
            }
            Text {
                id: txtFileName
                anchors.verticalCenter: btnAddDoc.verticalCenter
                anchors.left: btnAddDoc.right
                anchors.leftMargin: scaledMargin * 2
                horizontalAlignment: Text.AlignLeft
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                wrapMode: Text.WordWrap
                text: "No file selected"
            }
            WTextArea {
                id: txtNotes
                anchors.top: btnAddDoc.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.left: btnLost.left
                anchors.right: btnStolen.right
                height: txtContact.height * 3
                placeholderText: "Add Notes"
                font.pixelSize: fontSize / 1.1
            }

            TextButton{
                id: btnPrevious
                anchors.top: txtNotes.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.right: btnContinue.left
                anchors.rightMargin: scaledMargin
                text: "Previous"
                selected: true
                height: itemHeight
                widthRate: 2
                onClicked: {
                    manageClaimSwipeView.currentIndex = 1
                }
            }
            TextButton{
                id: btnContinue
                anchors.top: txtNotes.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.right: txtNotes.right
                text: "Continue"
                selected: true
                height: itemHeight
                enabled: btnLost.selected || btnStolen.selected
                widthRate: 2
                onClicked: {
                    utility.reportClaim(btnLost.selected, txtContact.text, "file:///" + txtFileName.text, txtNotes.text)
                    manageClaimSwipeView.currentIndex = 7
                    manageSummaryFrame.setIdx(p_idx)
                    manageSummaryFrame.prevManageClaimViewIdx = 2
                }
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
    function setIdx(idx)
    {
        p_idx = idx
        headerText.text = "Report: " + utility.getWName(p_idx)
    }
}
