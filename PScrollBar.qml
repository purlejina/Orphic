import QtQuick 2.0;

Item {
    id: scrollbar;
    width: (handleSize + 2 * (backScrollbar.border.width +1));
    visible: (flickable.visibleArea.heightRatio < 1.0);
    anchors {
        top: flickable.top;
        right: flickable.right;
        bottom: flickable.bottom;
        //margins: 1;
    }

    property Flickable flickable               : null;
    property int       handleSize              : 7;

    function scrollDown () {
        flickable.contentY = Math.min (flickable.contentY + (flickable.height / 4), flickable.contentHeight - flickable.height);
    }
    function scrollUp () {
        flickable.contentY = Math.max (flickable.contentY - (flickable.height / 4), 0);
    }

   Binding {
        target: handle;
        property: "y";
        value: (flickable.contentY * clicker.drag.maximumY / (flickable.contentHeight - flickable.height));
        when: (!clicker.drag.active);
    }
    Binding {
        target: flickable;
        property: "contentY";
        value: (handle.y * (flickable.contentHeight - flickable.height) / clicker.drag.maximumY);
        when: (clicker.drag.active || clicker.pressed);
    }
    Rectangle {
        id: backScrollbar;
//        radius: 2;
        antialiasing: true;
        color: "transparent"//"#252525"
        anchors { fill: parent; }

        MouseArea {
            anchors.fill: parent;
            onClicked: { }
        }
    }
    Item {
        id: groove;
        clip: true;
        anchors {
            fill: parent;
            topMargin: (backScrollbar.border.width +1 /*+ btnUp.height*/ +1);
            leftMargin: (backScrollbar.border.width +1);
            rightMargin: (backScrollbar.border.width +1);
            bottomMargin: (backScrollbar.border.width +1 /*+ btnDown.height*/ +1);
        }

        MouseArea {
            id: clicker;
            drag {
                target: handle;
                minimumY: 0;
                maximumY: (groove.height - handle.height);
                axis: Drag.YAxis;
            }
            anchors { fill: parent; }
            onClicked: { flickable.contentY = (mouse.y / groove.height * (flickable.contentHeight - flickable.height)); }
        }
        Item {
            id: handle;
            height: Math.max (20, (flickable.visibleArea.heightRatio * groove.height));
            anchors {
                left: parent.left;
                right: parent.right;
            }

            Rectangle {
                id: backHandle;
                color: (clicker.pressed ? "#777777" : "#777777");
//                opacity: (flickable.moving ? 1.0 : 0.0);
                property bool bMoving: flickable.moving ? true : false
                anchors { fill: parent; }
//                radius: width / 3.5
                onBMovingChanged: {
                    if (bMoving === true)
                    {
                        backHandle.state = "expanded"
                        backHandle.enabled = true
                    }
                    else
                    {
                        timer.restart()
                    }
                }

                onStateChanged: {
                    if (state === "expanded")
                        timer.restart()
                    else
                        timer.stop()
                }

                states: [
                    State {
                        name: "expanded"
                        PropertyChanges {
                            target: backHandle
                            opacity: 1.0
                        }
                    },
                    State {
                        name: "collapsed"
                        PropertyChanges {
                            target: backHandle
                            opacity: 0.0
                        }
                    }
                ]

                transitions: [
                    Transition {
                        NumberAnimation { target: backHandle; property: "opacity"; duration: 500 }
                    }
                ]
                Timer {
                    id: timer
                    interval: 2000
                    onTriggered: {
                        backHandle.state = "collapsed"
                        backHandle.enabled = false
                    }
                }
            }
        }
    }
}
