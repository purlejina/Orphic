import QtQuick 2.7
import "Global"

Rectangle {
    id: page
    color: "transparent"
    property alias claimedOn: txtClaimedContent.text
    property alias editedOn: txtEditedContent.text
    property alias reportedOn: txtReportedContent.text
    property alias foundOn: txtFoundContent.text
    property alias transferredOn: txtTransferredContent.text
    property alias transactionId: txtId1Content.text
    //claimed on
    Text{
        id: txtClaimed
        text: "Claimed on: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: parent.top
        anchors.left: parent.left
    }
    Text{
        id: txtClaimedContent
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: txtClaimed.right
        anchors.right: parent.right
    }
    Text{
        id: txtID1
        text: "Transaction ID: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtClaimed.bottom
        anchors.topMargin: scaledMargin
        anchors.left: parent.left
    }
    Text{
        id: txtId1Content
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtClaimed.bottom
        anchors.topMargin: scaledMargin
        anchors.left: txtID1.right
        anchors.right: parent.right
    }

    //edited on
    Text{
        id: txtEdited
        text: "Edited on: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtID1.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: parent.left
    }
    Text{
        id: txtEditedContent
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtID1.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: txtEdited.right
        anchors.right: parent.right
    }
    Text{
        id: txtID2
        text: "Transaction ID: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtEdited.bottom
        anchors.topMargin: scaledMargin
        anchors.left: parent.left
    }
    Text{
        id: txtId2Content
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtEdited.bottom
        anchors.topMargin: scaledMargin
        anchors.left: txtID2.right
        anchors.right: parent.right
        text: txtId1Content.text
    }
    //edited on
    Text{
        id: txtReported
        text: "Reported on: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtID2.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: parent.left
    }
    Text{
        id: txtReportedContent
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtID2.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: txtReported.right
        anchors.right: parent.right
    }
    Text{
        id: txtID3
        text: "Transaction ID: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtReported.bottom
        anchors.topMargin: scaledMargin
        anchors.left: parent.left
    }
    Text{
        id: txtId3Content
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtReported.bottom
        anchors.topMargin: scaledMargin
        anchors.left: txtID3.right
        anchors.right: parent.right
        text: txtId1Content.text
    }
    //edited on
    Text{
        id: txtFound
        text: "Found on: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtID3.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: parent.left
    }
    Text{
        id: txtFoundContent
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtID3.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: txtFound.right
        anchors.right: parent.right
    }
    Text{
        id: txtID4
        text: "Transaction ID: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtFound.bottom
        anchors.topMargin: scaledMargin
        anchors.left: parent.left
    }
    Text{
        id: txtId4Content
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtFound.bottom
        anchors.topMargin: scaledMargin
        anchors.left: txtID4.right
        anchors.right: parent.right
        text: txtId1Content.text
    }
    //edited on
    Text{
        id: txtTransferred
        text: "Transferred on: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtID4.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: parent.left
    }
    Text{
        id: txtTransferredContent
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtID4.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: txtTransferred.right
        anchors.right: parent.right
    }
    Text{
        id: txtID5
        text: "Transaction ID: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 1.5
        anchors.top: txtTransferred.bottom
        anchors.topMargin: scaledMargin
        anchors.left: parent.left
    }
    Text{
        id: txtId5Content
        color: Variables.textColor
        font.pixelSize: fontSize / 1.2
        anchors.top: txtTransferred.bottom
        anchors.topMargin: scaledMargin
        anchors.left: txtID5.right
        anchors.right: parent.right
        text: txtId1Content.text
    }
}
