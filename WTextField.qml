import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

TextField {
    id: txtField
    style: TextFieldStyle {
        textColor: Variables.textColor
        placeholderTextColor: Variables.placeHolderTextColor
        background: Rectangle {
            color: Variables.buttonColor
            radius: 0
            border.color: txtField.focus ? Variables.focusColor : Variables.borderNormalColor
            border.width: 1
        }
    }
}
