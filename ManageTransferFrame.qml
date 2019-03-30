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
    property alias transferKey: txtTransferKey.text

    Text {
        id: headerText
        font.pixelSize: fontSize
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 2.5
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Transfer: "
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

            WTextField {
                id: txtReceiversAddress
                anchors.top: parent.top
                width: itemW
                anchors.horizontalCenter: parent.horizontalCenter
                height: itemHeight
                placeholderText: "Recievers Address"
                font.pixelSize: fontSize / 1.1
                onTextChanged: {

                }
            }

            WTextField {
                id: txtTransferKey
                anchors.top: txtReceiversAddress.bottom
                anchors.topMargin: scaledMargin * 2
                width: itemW
                anchors.horizontalCenter: parent.horizontalCenter
                height: itemHeight
                placeholderText: "Transfer Key"
                font.pixelSize: fontSize / 1.1
            }

            WTextArea {
                id: txtNotes
                anchors.top: txtTransferKey.bottom
                anchors.topMargin: scaledMargin * 2
                width: itemW
                anchors.horizontalCenter: parent.horizontalCenter
                height: txtTransferKey.height * 3
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
                enabled: txtReceiversAddress.text.trim() != "" ? true : false
                widthRate: 2
                onClicked: {
                    utility.transferClaim(txtReceiversAddress.text, txtTransferKey.text, txtNotes.text)
                    manageClaimSwipeView.currentIndex = 7
                    manageSummaryFrame.setIdx(p_idx)
                    manageSummaryFrame.prevManageClaimViewIdx = 3
                }
            }
        }
    }

    function setIdx(idx)
    {
        p_idx = idx
        headerText.text = "Transfer: " + utility.getWName(p_idx)
    }

}
