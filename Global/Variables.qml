pragma Singleton
import QtQuick 2.0

QtObject {
    property var darkModeOn: qsTr("0") // dark mode
    property var backgroundColor: qsTr("white") // dark mode
    property var borderNormalColor: qsTr("lightgray") // dark mode
    property var focusColor: qsTr("#0087bf")
    property var textColor: qsTr("black") // dark mode
    property var textColor_1: qsTr("#222222") // dark mode
    property var disableTextColor: qsTr("#dddddd") // dark mode
    property var buttonColor: qsTr("white")
    property var columnColor: qsTr("lightgray")

    function darkMode() {
        if (darkModeOn === "0"){
            darkModeOn = "1"
            backgroundColor = "#212120"
            textColor = "white"
            textColor_1 = "#cccccc";
            buttonColor = "#1e1818"
            columnColor = "#333333"
        }
        else {
            darkModeOn = "0"
            backgroundColor = "white"
            textColor = "black"
            textColor_1 = "#222222";
            buttonColor = "white"
            columnColor = "lightgray"
        }
    }
}
