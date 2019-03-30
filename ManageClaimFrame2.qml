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
    property int itemW: Math.min(parent.width / 3.5, 350)
    property alias pname: txtName.text
    property alias ptype:txtTypeContent.text
    property alias pmake : txtMakeContent.text
    property alias pmodel : txtModelContent.text
    property alias pyear : txtYearContent.text
    property alias pserial : txtSerialContent.text
    property alias pother : txtOtherContent.text
    property alias pdesc : txtDescriptionContent.text
    property alias pfile : image.source

    Rectangle{
        id: infoRect
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 2.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: scaledMargin * 3.5
        anchors.rightMargin: scaledMargin * 3.5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: scaledMargin * 2
        color: "transparent"
        border.width: 1
        border.color: Variables.borderNormalColor
        Text{
            id: txtName
            color: Variables.textColor
            font.pixelSize: fontSize / 1.2
            width: itemWidth / 2
            anchors.top: parent.top
            anchors.topMargin: scaledMargin
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Rectangle{
            id: underBar
            width: parent.width
            height: 1
            anchors.top: txtName.bottom
            anchors.topMargin: scaledMargin
            color:Variables.borderNormalColor
        }
        Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: underBar.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: scaledMargin
            anchors.rightMargin: scaledMargin
            anchors.topMargin: scaledMargin
            anchors.bottomMargin: scaledMargin
            color: "transparent"

            Text{
                id: txtType
                text: "Type: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: parent.top
                anchors.left: parent.left
            }
            Text{
                id: txtTypeContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: parent.top
                anchors.left: txtType.right
            }

            Text{
                id: txtMake
                text: "Make: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: txtType.bottom
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
            }
            Text{
                id: txtMakeContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: txtType.bottom
                anchors.topMargin: scaledMargin
                anchors.left: txtMake.right
            }
            Text{
                id: txtModel
                text: "Model: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: txtMake.bottom
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
            }
            Text{
                id: txtModelContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: txtMake.bottom
                anchors.topMargin: scaledMargin
                anchors.left: txtModel.right
            }
            Text{
                id: txtYear
                text: "Year: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: txtModel.bottom
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
            }
            Text{
                id: txtYearContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: txtModel.bottom
                anchors.topMargin: scaledMargin
                anchors.left: txtYear.right
            }
            Text{
                id: txtSerial
                text: "Serial: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: txtYear.bottom
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
            }
            Text{
                id: txtSerialContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: txtYear.bottom
                anchors.topMargin: scaledMargin
                anchors.left: txtSerial.right
            }
            Text{
                id: txtOther
                text: "Other: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: txtSerial.bottom
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
            }
            Text{
                id: txtOtherContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: txtSerial.bottom
                anchors.topMargin: scaledMargin
                anchors.left: txtOther.right
            }
            Text{
                id: txtDescription
                text: "Description: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: txtOther.bottom
                anchors.topMargin: scaledMargin
                anchors.left: parent.left
            }
            Text{
                id: txtDescriptionContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: txtOther.bottom
                anchors.topMargin: scaledMargin
                anchors.left: txtDescription.right
            }
            Rectangle{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: txtDescriptionContent.bottom
                anchors.margins: scaledMargin
                width: height
                color: "transparent"
                Image{
                    id: image
                    width: parent.width / 1.5
                    height: parent.height / 1.5
                    anchors.centerIn: parent
                }
            }
            HistoryView{
                id: historyview
                color: "transparent"
                anchors.top: txtDescriptionContent.bottom
                anchors.topMargin: scaledMargin * 2
                anchors.bottom: parent.bottom
            }
        }
    }

    function setInfo(idx)
    {
        p_idx = idx
        pname = utility.getWName(idx)
        ptype = utility.getWType(idx)
        pmake = utility.getWMake(idx)
        pmodel = utility.getWModel(idx)
        pyear = utility.getWYear(idx)
        pserial = utility.getWSerial(idx)
        pother = utility.getWOther(idx)
        pdesc = utility.getWDescription(idx)
        pfile = utility.getWPicture(idx)
        historyview.transactionId = utility.getWTransactionId(idx)
        historyview.claimedOn = utility.getWClaimedOn(idx)
        historyview.editedOn = utility.getWEditedOn(idx)
        historyview.reportedOn = utility.getWReportedOn(idx)
        historyview.foundOn = utility.getWFoundOn(idx)
        historyview.transferredOn = utility.getWTransferredOn(idx)
    }
}
