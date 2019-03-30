import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Global"

Rectangle {
    id: rectangle
    property int p_idx: -1
    Rectangle{
        id: infoRect
        width: parent.width
        height: childrenRect.height
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
            text: utility.getWType(p_idx)
            color: Variables.textColor
            font.pixelSize: fontSize
            width: textWidth
            anchors.top: parent.top
            anchors.left: txtType.right
        }

        Text{
            id: txtName
            text: "Name: "
            color: Variables.textColor_1
            font.pixelSize: fontSize / 1.2
            width: itemWidth / 2
            anchors.top: txtType.bottom
            anchors.topMargin: scaledMargin
            anchors.left: parent.left
        }
        Text{
            id: txtNameContent
            text: utility.getWName(p_idx)
            color: Variables.textColor
            font.pixelSize: fontSize
            width: textWidth
            anchors.top: txtType.bottom
            anchors.topMargin: scaledMargin
            anchors.left: txtName.right
        }
        Text{
            id: txtMake
            text: "Make: "
            color: Variables.textColor_1
            font.pixelSize: fontSize / 1.2
            width: itemWidth / 2
            anchors.top: txtName.bottom
            anchors.topMargin: scaledMargin
            anchors.left: parent.left
        }
        Text{
            id: txtMakeContent
            text: utility.getWMake(p_idx)
            color: Variables.textColor
            font.pixelSize: fontSize
            width: textWidth
            anchors.top: txtName.bottom
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
            text: utility.getWModel(p_idx)
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
            text: utility.getWYear(p_idx)
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
            text: utility.getWSerial(p_idx)
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
            text: utility.getWOther(p_idx)
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
            text: utility.getWDescription(p_idx)
            color: Variables.textColor
            font.pixelSize: fontSize
            width: textWidth
            anchors.top: txtOther.bottom
            anchors.topMargin: scaledMargin
            anchors.left: txtDescription.right
        }
    }
    Rectangle{
        anchors.right: parent.right
        height: infoRect.height
        width: height
        color: "transparent"
        Image{
            id: image
            width: parent.width / 1.2
            height: parent.height / 1.2
            anchors.centerIn: parent
            source: utility.getWPicture(p_idx)
        }
    }

    Text{
        id: txtAdditional
        text: "Additional Documents: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 2
        anchors.top: infoRect.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: parent.left
    }

    Text{
        id: txtHistory
        text: "History: "
        color: Variables.textColor_1
        font.pixelSize: fontSize / 1.2
        width: itemWidth / 2
        anchors.top: txtAdditional.bottom
        anchors.topMargin: scaledMargin
        anchors.left: parent.left
    }

    HistoryView{
        id: historyview
        anchors.top: txtHistory.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        anchors.topMargin: scaledMargin
        color: "transparent"
    }
//    PScrollBar{
//        id: scrollbar
//        flickable: historyview
//    }

    function setInfo(idx, pSearch)
    {
        p_idx = idx
        txtTypeContent.text = utility.getWType(p_idx, pSearch)
        txtNameContent.text = utility.getWName(p_idx, pSearch)
        txtMakeContent.text = utility.getWMake(p_idx, pSearch)
        txtModelContent.text = utility.getWModel(p_idx, pSearch)
        txtYearContent.text = utility.getWYear(p_idx, pSearch)
        txtSerialContent.text = utility.getWSerial(p_idx, pSearch)
        txtOtherContent.text = utility.getWOther(p_idx, pSearch)
        txtDescriptionContent.text = utility.getWDescription(p_idx, pSearch)
        image.source = utility.getWPicture(p_idx, pSearch)
        historyview.transactionId = utility.getWTransactionId(p_idx, pSearch)
        historyview.claimedOn = utility.getWClaimedOn(p_idx, pSearch)
        historyview.editedOn = utility.getWEditedOn(p_idx, pSearch)
        historyview.reportedOn = utility.getWReportedOn(p_idx, pSearch)
        historyview.foundOn = utility.getWFoundOn(p_idx, pSearch)
        historyview.transferredOn = utility.getWTransferredOn(p_idx, pSearch)
    }

//    Rectangle{
//        anchors.top: txtHistory.bottom
//        anchors.bottom: parent.bottom
//        width: parent.width
//        anchors.topMargin: scaledMargin
//        color: "transparent"
//        HistoryListView{
//            id: historylistview
//            color: "transparent"
//            anchors.fill: parent
//        }
//    }
}
