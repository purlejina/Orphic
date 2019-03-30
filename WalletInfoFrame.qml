import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import "Global"

Item {
    id:walletInfoBox
    anchors.fill:parent
    property int mainStackViewIdx: -1
    property int walletStackViewIdx: -1
    property bool bRefresh: false
    Rectangle {
        id: rectangle
        anchors.fill: parent
        // header that says wallet name on top of background
        color: Variables.backgroundColor
        Text {
            id: title
            text: utility.getWalletName()
            font.pixelSize: fontSize
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: scaledMargin * 2
            color: Variables.textColor
        }
        Rectangle{
            id: infoOutput
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: title.bottom
            anchors.topMargin: scaledMargin * 2
            anchors.leftMargin: scaledMargin / 2
            anchors.rightMargin: scaledMargin / 2
            anchors.bottomMargin: scaledMargin / 2
            color: Variables.backgroundColor

            WalletListView{
                id: walletlistview
                color: "transparent"
                anchors.fill: parent
            }
            Text {
                id: txtClaimMessage
                font.pixelSize: fontSize * 1.2
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
                color: Variables.textColor
                text: "No claims"
                visible: !walletlistview.visible
            }
        }
    }
    Text {
        id: txtWalletMessage
        font.pixelSize: fontSize * 1.2
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        color: Variables.textColor
        text: "No wallet open"
        visible: walletModel.columnCount() > 0 ? false : true
    }
    Dialog {
        id: dlgMoreInformation
        modality: Qt.WindowModal
        title: "More information"
        contentItem: Rectangle {
            color: Variables.backgroundColor
            implicitWidth: 700
            implicitHeight: 500
            WalletMoreInfoPage {
                id: walletMoreInfoPage
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: scaledMargin * 2
                color: "transparent"
            }
            Keys.onEnterPressed: dlgMoreInformation.accept()
            Keys.onEscapePressed: dlgMoreInformation.reject()
        }
    }
    onWalletStackViewIdxChanged: {
        visibleChanged()
    }

    onMainStackViewIdxChanged: {
        visibleChanged()
    }

    onBRefreshChanged: {
        visibleChanged()
    }

    function visibleChanged()
    {
        if (mainStackViewIdx != 0)
            return

        if (walletStackViewIdx != 0)
            return

        if (utility.isWalletOpen())
        {
            title.text = utility.getWalletName()
            title.visible = true
            infoOutput.visible = true
            txtWalletMessage.visible = false
            walletlistview.visible = walletModel.rowCount() > 0 ? true : false
        }
        else
        {
            title.visible = false
            infoOutput.visible = false
            txtWalletMessage.visible = true
        }
    }
}
