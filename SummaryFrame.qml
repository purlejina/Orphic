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
    property string pname
    property string ptype
    property alias pmake : txtMakeContent.text
    property alias pmodel : txtModelContent.text
    property alias pyear : txtYearContent.text
    property alias pserial : txtSerialContent.text
    property alias pother : txtOtherContent.text
    property alias pdesc : txtDescriptionContent.text
    property alias pfile : image.source

    Text {
        id: headerText
        font.pixelSize: fontSize
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 2.5
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Summary"
        color: Variables.textColor
    }
    Rectangle{
        id: infoRect
        anchors.top: headerText.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: scaledMargin * 3.5
        anchors.rightMargin: scaledMargin * 3.5
        anchors.bottom: chkVerify.top
        anchors.bottomMargin: scaledMargin * 2
        color: "transparent"
        border.width: 1
        border.color: Variables.borderNormalColor
        Text{
            id: txtNameType
            color: Variables.textColor
            font.pixelSize: fontSize / 1.2
            width: itemWidth / 2
            anchors.top: parent.top
            anchors.topMargin: scaledMargin
            anchors.horizontalCenter: parent.horizontalCenter
            text: pname + " - " + ptype
        }
        Rectangle{
            id: underBar
            width: parent.width
            height: 1
            anchors.top: txtNameType.bottom
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
                id: txtMake
                text: "Make: "
                color: Variables.textColor_1
                font.pixelSize: fontSize / 1.2
                width: itemWidth / 2
                anchors.top: parent.top
                anchors.left: parent.left
            }
            Text{
                id: txtMakeContent
                color: Variables.textColor
                font.pixelSize: fontSize
                width: textWidth
                anchors.top: parent.top
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
                height: parent.height
                width: height
                color: "transparent"
                Image{
                    id: image
                    width: parent.width / 1.5
                    height: parent.height / 1.5
                    anchors.centerIn: parent
                }
            }
            HistoryListView{
                id: historylistview
                color: "transparent"
                anchors.top: txtDescriptionContent.bottom
                anchors.topMargin: scaledMargin * 2
            }
        }
    }

    WCheckBox {
        id: chkVerify
        anchors.bottom: password.top
        anchors.bottomMargin: scaledMargin
        text: "I verify that all information is correct."
        anchors.left: infoRect.left
        font.pixelSize: fontSize / 1.2
    }
    WTextField {
        id: password
        anchors.left: infoRect.left
        anchors.bottom: wrongPassword.top
        anchors.bottomMargin: scaledMargin
        width: itemW
        height: itemHeight
        placeholderText: "Enter Password"
        echoMode: TextInput.Password
        font.pixelSize: fontSize / 1.1
        onTextChanged: {
            wrongPassword.visible = false
        }
    }
    TextButton{
        id: btnPrevious
        anchors.bottom: wrongPassword.top
        anchors.bottomMargin: scaledMargin
        anchors.right: btnContinue.left
        anchors.rightMargin: scaledMargin
        text: "Previous"
        selected: true
        height: itemHeight
        widthRate: 2
        onClicked: {
            newClaimSwipeView.currentIndex = newClaimSwipeView.currentIndex - 1
        }
    }
    TextButton{
        id: btnContinue
        anchors.bottom: wrongPassword.top
        anchors.bottomMargin: scaledMargin
        anchors.right: infoRect.right
        text: "Continue"
        selected: true
        height: itemHeight
        enabled: chkVerify.checked
        widthRate: 2
        onClicked: {
            if (utility.checkPassword(password.text) === false)
            {
                wrongPassword.visible = true
                return
            }
            utility.createTransaction(pname, ptype, pmake, pmodel, pyear, pserial, pother, pdesc, pfile)
            newClaimSwipeView.currentIndex = newClaimSwipeView.currentIndex + 1
        }
    }
    Text {
        id: wrongPassword
        anchors.bottom: parent.bottom
        anchors.bottomMargin: scaledMargin
        anchors.left: password.left
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignRight
        font.pixelSize: fontSize / 1.2
        color: "red"
        text: "Password Incorrect *testing"
        height: itemHeight / 1.5
        visible: false
    }
    function setInfo(p_type, p_name, p_make, p_model, p_year, p_serial, p_other, p_desc, p_file)
    {
        pname = p_name
        ptype = p_type
        pmake = p_make
        pmodel = p_model
        pyear = p_year
        pserial = p_serial
        pother = p_other
        pdesc = p_desc
        pfile = p_file
    }
}
