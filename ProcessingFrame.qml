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
    property int itemW: Math.min(parent.width / 3.5, 350)
    property int swipeViewCurIdx: 0
    property int fromWhere: 0
    Rectangle
    {
        width: parent.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        Text {
            id: txtMessage
            font.pixelSize: fontSize / 1.1
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            color: Variables.textColor
            text: "Your claim is being processed. \n\n Thank you for using Orphic Guard."
        }
        TextButton{
            id: btnReturn
            anchors.top: txtMessage.bottom
            anchors.topMargin: scaledMargin * 2
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Return to Wallet"
            selected: true
            height: itemHeight
            widthRate: 2
            onClicked: {
                gotoPageWithIdx(0, 0)

                if (fromWhere === 0)
                    newClaimSwipeView.currentIndex = 0
                else if (fromWhere === 1)
                    receiveClaimSwipeView.currentIndex = 0
                else if (fromWhere === 2)
                {
                    manageClaimSwipeView.currentIndex = 0
                    manageLeftMenu.setButtonSelection(0)
                    menuView.currentIndex = 0
                }
            }
        }
    }
    onSwipeViewCurIdxChanged: {
        if (fromWhere != 0)
            return

        if (swipeViewCurIdx != 3)
            return

        if (utility.checkTransaction("transactionId"))
            txtMessage.text = "Your claim is being processed. \n\n Thank you for using Orphic Guard."
        else
            txtMessage.text = utility.getTransactionMsg()
    }
}
