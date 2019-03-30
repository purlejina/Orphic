pragma Singleton
import QtQuick 2.0

QtObject {
    property var darkModeOn: qsTr("0") // dark mode
    property var backgroundColor: qsTr("white") // dark mode
    property var borderColor: qsTr("black") // dark mode
    property var borderNormalColor: qsTr("lightgray") // dark mode
    property var focusColor: qsTr("#0087bf")
    property var textColor: qsTr("black") // dark mode
    property var textColor_1: qsTr("#222222") // dark mode
    property var placeHolderTextColor: qsTr("lightgray") // dark mode
    property var disableTextColor: qsTr("#cccccc") // dark mode
    property var buttonColor: qsTr("white")
    property var buttonHoverColor: qsTr("#dddddd")
    property var buttonPressColor: qsTr("#cc10c7ff")
    property var buttonSelectColor: qsTr("#10c7ff")
    property var toggleButtonColor: qsTr("#cccccc")
    property var columnColor: qsTr("lightgray")
    property var sectionColor: qsTr("#f6f6f6")

    function darkMode() {
        if (darkModeOn === "0"){
            darkModeOn = "1"
            backgroundColor = "#212120"
            borderColor = "white"
            textColor = "white"
            disableTextColor = "#555555"
            textColor_1 = "#cccccc";
            placeHolderTextColor = "gray"
            buttonColor = "#1e1818"
            buttonHoverColor = "#2e2828"
            buttonPressColor = "#cc10c7ff"
            buttonSelectColor = "#10c7ff"
            columnColor = "#333333"
            sectionColor = "#434343"
            toggleButtonColor = "#1e1818"
        }
        else {
            darkModeOn = "0"
            backgroundColor = "white"
            borderColor = "black"
            textColor = "black"
            textColor_1 = "#222222"
            disableTextColor = "#cccccc"
            placeHolderTextColor = "lightgray"
            buttonColor = "white"
            buttonHoverColor = "#dddddd"
            buttonPressColor = "#cc10c7ff"
            buttonSelectColor = "#10c7ff"
            columnColor = "lightgray"
            sectionColor = "#f6f6f6"
            toggleButtonColor = "#cccccc"
        }
    }
}
