import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
//import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"


Window {
    id: win
    visible: true
    width: 800 // original is 640
    height: 700 // original is 480

    title: qsTr("Orphic Guard")
    property int scaledMargin: 10
    property int itemHeight: 35
    property int itemWidth: 150
    property int fontSize: 13
    property int leftMenuMaxWidth: 200
    property int leftMenuMinWidth: 150
    property int textWidth: itemWidth / 2
    property int contWidth: itemWidth / 2.7
    property int lineHeight: itemHeight / 1.35

    Rectangle{
        id:header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: "#2d3446"
    }
    Rectangle{
        id: mainBox
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: footer.top
        color: Variables.backgroundColor
        WSwipeView{
            id: menuView
            anchors.left: parent.left
            width: Math.max(Math.min(parent.width / 5, leftMenuMaxWidth), leftMenuMinWidth)
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            z: 2
            Page
            {
                MainLeftMenu
                {
                    id: mainLeftMenu
                    anchors.fill: parent
                    clip: true
                }
            }
            Page
            {
                ManageLeftMenu
                {
                    id: manageLeftMenu
                    anchors.fill: parent
                    clip: true
                }
            }
            interactive: false
        }

        WSwipeView {
            id: mainStackView
            anchors.right: parent.right
            anchors.left: menuView.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Page {
                id: walletView
                WSwipeView{
                    id: walletStackView
                    anchors.fill: parent
                    clip: true
                    Page{
                        id: walletInfoPage
                        WalletInfoFrame {
                            id: walletInfoFrame
                            mainStackViewIdx: mainStackView.currentIndex
                            walletStackViewIdx: walletStackView.currentIndex
                            clip: true
                        }
                    }
                    Page{
                        id: newClaimView

                        SwipeView{
                            id: newClaimSwipeView
                            anchors.fill: parent
                            clip: true
                            Page{
                                NewClaimFrame {
                                    id: newClaimFrameParent
                                    clip: true
                                }
                            }
                            Page{
                                SummaryFrame {
                                    id: summaryFrame
                                    clip: true
                                }
                            }
                            Page{
                                PaymentFrame {
                                    id: paymentFrame
                                    clip: true
                                }
                            }
                            Page{
                                ProcessingFrame {
                                    id: processFrame
                                    swipeViewCurIdx: newClaimSwipeView.currentIndex
                                    clip: true
                                }
                            }
                            interactive: false
                        }
                    }
                    Page{
                        id: recieveClaimPage

                        SwipeView{
                            id: receiveClaimSwipeView
                            anchors.fill: parent
                            clip: true
                            Page{
                                ReceiveClaimFrame {
                                    id: receiveClaimFrame
                                    clip: true
                                }
                            }
                            Page{
                                ProcessingFrame {
                                    swipeViewCurIdx: receiveClaimSwipeView.currentIndex
                                    fromWhere: 1
                                    clip: true
                                }
                            }
                            interactive: false
                        }
                    }
                    Page{

                        WSwipeView{
                            id: manageClaimSwipeView
                            anchors.fill: parent
                            clip: true
                            Page{
                                ManageClaimFrame {
                                    id: manageClaimsFrame
                                    clip: true
                                }
                            }
                            Page{
                                ManageClaimFrame2 {
                                    id: manageClaimsFrame2
                                    clip: true
                                }
                            }
                            Page{
                                ManageReportFrame {
                                    id: manageReportFrame
                                    clip: true
                                }
                            }
                            Page{
                                ManageTransferFrame {
                                    id: manageTransferFrame
                                    clip: true
                                }
                            }
                            Page{
                                ManageEditFrame {
                                    id: manageEditFrame
                                    clip: true
                                }
                            }
                            Page{
                                ManageDisclaimFrame {
                                    id: manageDisclaimFrame
                                    clip: true
                                }
                            }
                            Page{
                                ManageFoundFrame {
                                    id: manageFoundFrame
                                    clip: true
                                }
                            }
                            Page{
                                SummaryFrame {
                                    id: manageSummaryFrame
                                    clip: true
                                    fromNew: false
                                }
                            }
                            Page{
                                PaymentFrame {
                                    id: managePaymentFrame
                                    clip: true
                                    fromNew: false
                                }
                            }
                            Page{
                                ProcessingFrame {
                                    id: manageProcessFrame
                                    swipeViewCurIdx: newClaimSwipeView.currentIndex
                                    clip: true
                                    fromWhere: 2
                                }
                            }

                            interactive: false
                        }
                    }
                }
            }
            Page {
                id: newWalletFrame
                NewWalletFrame {
                    clip: true
                }
            }
            Page {
                id: loadWalletFrame
                LoadWalletFrame {
                    clip: true
                }
            }
            Page {
                id: clearWalletFrame
                ClearWalletFrame {
                    clip: true
                }
            }
            Page{
                SearchFrame {
                    id: searchFrameParent
                    clip: true
                }
            }
            Page{
                SettingsFrame {
                    id: settingsFrameParent
                    clip: true
                }
            }
            interactive: false
        }
    }
    Rectangle{
        id: footer
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 120
        color: "#2d3446"
        Rectangle {
            id: image
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            width: height
            color: "#2d3446"
            Image{
                id: logo
                source: "Images/biggercircle3.png"
                smooth: true
                visible: true
                anchors.fill: parent

            }
        }
        Text {
            id: orphicGuard
            anchors.right: image.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: "Orphic Guard"
            color: "white"
            font.pixelSize: 20
        }
        Text {
            id: blockchainStatus
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: "Blockchain Status: testing*"// will contain blockchain status
            font.pixelSize: 11
            color: "white"
        }
        Text {
            id: wallet
            anchors.top: blockchainStatus.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 5
            text: "Current Wallet: testing*" // will contain current wallet
            font.pixelSize: 11
            color: "white"
        }
    }
    function gotoPageWithIdx(largeIdx, smallIdx)
    {
        mainLeftMenu.gotoPage(largeIdx, smallIdx)
    }
}
