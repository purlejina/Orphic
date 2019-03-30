import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Rectangle{
    id: root
    color: Variables.columnColor
    property bool isWalletOpen: false
    Rectangle {
        id: wholeRect
        width: parent.width - scaledMargin
        height: childrenRect.height
        anchors.centerIn: parent
        color: "transparent"
        TextButton{
            id: btnBack
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: itemHeight
            text: "Back"
            onClicked: {
                manageClaimSwipeView.currentIndex = 0
                menuView.currentIndex = 0
                setButtonSelection(0)
            }
        }

        TextButton{
            id: btnReport
            text: "Report"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: btnBack.bottom
            anchors.topMargin: scaledMargin * 2.5
            height: itemHeight
            onClicked: {
                manageClaimSwipeView.currentIndex = 2
                manageReportFrame.setIdx(manageClaimsFrame2.p_idx)
                setButtonSelection(1)
            }
        }

        TextButton
        {
            id: btnTransfer
            text: "Transfer"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: btnReport.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                manageClaimSwipeView.currentIndex = 3
                manageTransferFrame.transferKey = utility.transferKey()
                manageTransferFrame.setIdx(manageClaimsFrame2.p_idx)
                setButtonSelection(2)
            }
        }

        TextButton{
            id: btnEdit
            text: "Edit"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: btnTransfer.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                manageClaimSwipeView.currentIndex = 4
                manageEditFrame.setIdx(manageClaimsFrame2.p_idx)
                setButtonSelection(3)
            }
        }

        TextButton{
            id: btnDisclaim
            text: "Disclaim"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: btnEdit.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                manageClaimSwipeView.currentIndex = 5
                manageDisclaimFrame.setIdx(manageClaimsFrame2.p_idx)
                setButtonSelection(4)
            }
        }
        TextButton{
            id: btnFound
            text: "Found"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: btnDisclaim.bottom
            anchors.topMargin: scaledMargin * 1.5
            height: itemHeight
            onClicked: {
                manageClaimSwipeView.currentIndex = 6
                manageFoundFrame.setIdx(manageClaimsFrame2.p_idx)
                setButtonSelection(5)
            }
        }
    }
    function setButtonSelection(p_idx)
    {
        btnReport.selected = p_idx === 1 ? true : false
        btnTransfer.selected = p_idx === 2 ? true : false
        btnEdit.selected = p_idx === 3 ? true : false
        btnDisclaim.selected = p_idx === 4 ? true : false
        btnFound.selected = p_idx === 5 ? true : false
    }

//    function gotoPage(largeIdx, smallIdx)
//    {
//        mainStackView.currentIndex = largeIdx
//        if (largeIdx === 0)
//        {
//            walletStackView.currentIndex = smallIdx
//            btnWalletInfo.selected = smallIdx === 0 ? true : false
//            btnNewClaim.selected = smallIdx === 1 ? true : false
//            btnReceiveClaim.selected = smallIdx === 2 ? true : false
//            btnManageClaim.selected = smallIdx === 3 ? true : false
//            btnFound.selected = smallIdx === 4 ? true : false
//            btnSettings.selected = smallIdx === 5 ? true : false
//        }
//        btnBack.selected = largeIdx === 0 ? true : false
//        btnReport.selected = largeIdx === 1 ? true : false
//        btnTransfer.selected = largeIdx === 2 ? true : false
//        btnDisclaim.selected = largeIdx === 3 ? true : false
//    }
}

