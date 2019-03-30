import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

Rectangle {
    id:loadWalletBox
    anchors.fill:parent
    color: Variables.backgroundColor
    property int itemW: Math.min(parent.width / 2, 470)

    WTextField {
        id: txtSearch
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: scaledMargin * 3.5
        width: itemW
        height: itemHeight
        placeholderText: "Search"
        font.pixelSize: fontSize / 1.1
    }

    WCombobox {
        id: cmbSerialNumber
        currentIndex: 0
        anchors.left: txtSearch.left
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: scaledMargin
        anchors.top: txtSearch.bottom
        anchors.topMargin: scaledMargin * 2
        height: itemHeight
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
    TextButton{
        id: btnSearch
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: scaledMargin
        anchors.right: txtSearch.right
        anchors.top: txtSearch.bottom
        anchors.topMargin: scaledMargin * 2
        text: "Search"
        height: itemHeight
        selected: true
        enabled: txtSearch.text === "" ? false : true
        onClicked: {
            utility.searchBlockchain(txtSearch.text)
            txtClaimMessage.visible = !searchClaimModel.rowCount()
        }
    }
    Rectangle{
        id: listRect
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: btnSearch.bottom
        anchors.topMargin: scaledMargin * 2
        anchors.leftMargin: scaledMargin / 2
        anchors.rightMargin: scaledMargin / 2
        anchors.bottomMargin: scaledMargin / 2
        color: Variables.backgroundColor

        SearchClaimListView{
            id: searchlistview
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
            text: "No claims found"
            visible: !searchClaimModel.rowCount()
        }
    }
    Dialog {
        id: dlgMoreInformation
        modality: Qt.ApplicationModal
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
}
