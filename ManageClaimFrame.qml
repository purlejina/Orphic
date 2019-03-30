import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Rectangle {
    id:manageClaimBox
    anchors.fill:parent
    color: Variables.backgroundColor
    MangeClaimList{
        id: walletlistview
        color: "transparent"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: scaledMargin * 1.5
        anchors.rightMargin: scaledMargin * 1.5
        anchors.topMargin: scaledMargin * 2.5
        anchors.bottomMargin: scaledMargin * 2
    }
}
