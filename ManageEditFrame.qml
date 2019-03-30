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
    property int itemW: Math.min(parent.width / 2, 550)

    Text {
        id: headerText
        font.pixelSize: fontSize
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 2.5
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Edit: "
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

            WTextArea {
                id: txtNotes
                anchors.top: parent.top
                width: itemW
                anchors.horizontalCenter: parent.horizontalCenter
                height: itemHeight * 3
                placeholderText: "Add Notes"
                font.pixelSize: fontSize / 1.1
            }

            TextButton{
                id: btnAddDoc
                anchors.top: txtNotes.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.left: txtNotes.left
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

            WCheckBox {
                id: chkPublic
                anchors.left: txtNotes.left
                anchors.top: btnAddDoc.bottom
                anchors.topMargin: scaledMargin * 1.5
                text: "Make Publicly Viewable"
            }

            TextButton{
                id: btnPrevious
                anchors.top: chkPublic.bottom
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
                anchors.top: chkPublic.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.right: txtNotes.right
                text: "Continue"
                selected: true
                height: itemHeight
                enabled: txtNotes.text != "" || txtFileName.text != "No file selected" ? true : false
                widthRate: 2
                onClicked: {
                    utility.editClaim(txtNotes.text, "file:///" + txtFileName.text, chkPublic.checked)
                    manageClaimSwipeView.currentIndex = 7
                    manageSummaryFrame.setIdx(p_idx)
                    manageSummaryFrame.prevManageClaimViewIdx = 4
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
        headerText.text = "Edit: " + utility.getWName(p_idx)
    }

}
