import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "Global"

Item{
    id: button
    anchors.fill: parent
    property alias buttonText: innerText.text;
    property color color: "white"
    property color hoverColor: "#10c7ff"
    property color selectedColor:"#10c7ff"
    property color pressColor: "slategray"
    property int fontSize: 10
    property bool selected: false
    onEnabledChanged: state = ""
    signal clicked

    Rectangle {
        id: rectangleButton
        anchors.fill: parent
        color: Variables.buttonColor
        border.width: 1
        border.color: "black"
        radius: 2

        Text {
          id: innerText
          font.pointSize: fontSize
          anchors.centerIn: parent
          color: Variables.textColor
        }
    }
    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target:rectangleButton
                color: hoverColor
            }
            PropertyChanges {
                target:innerText
                color: "white"
            }
        },
         State {
            name: "Pressed"
            PropertyChanges {
                target: rectangleButton
                color: pressColor
            }
        },
        State {
            name: "Selected"
            PropertyChanges {
                target: rectangleButton
                color: selectedColor
            }
            PropertyChanges {
                target:innerText
                color: "white"
            }
        }
    ]
    MouseArea {
        hoverEnabled: true
        anchors.fill: button
        onEntered: {button.state="Hovering"}
        onExited: {
            if (selected)
                button.state="Selected";
            else
                button.state="";
        }
        onClicked: { button.clicked();}
        onPressed: { button.state="Pressed" }
        onReleased: {
            if (selected)
                button.state="Selected";
            else
                button.state="Hovering";
        }
    }

}
