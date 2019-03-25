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
        LeftMenu
        {
            id: leftMenu
            anchors.left: parent.left
            width: Math.max(Math.min(parent.width / 5, leftMenuMaxWidth), leftMenuMinWidth)
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            z: 2
        }
        WSwipeView {
            id: mainStackView
            anchors.right: parent.right
            anchors.left: leftMenu.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Page {
                id: walletView
                WSwipeView{
                    id: walletStackView
                    anchors.fill: parent
                    Page{
                        id: walletInfoFrame
                        WalletInfoFrame {
                            mainStackViewIdx: mainStackView.currentIndex
                            walletStackViewIdx: walletStackView.currentIndex
                        }
                    }
                    Page{
                        id: newClaimView
                        SwipeView{
                            id: newClaimSwipeView
                            anchors.fill: parent
                            Page{
                                NewClaimFrame {
                                    id: newClaimFrameParent
                                }
                            }
                            Page{
                                SummaryFrame {
                                    id: summaryFrame
                                }
                            }
                            Page{
                                PaymentFrame {
                                    id: paymentFrame
                                }
                            }
                            Page{
                                ProcessingFrame {
                                    id: processFrame
                                    swipeViewCurIdx: newClaimSwipeView.currentIndex
                                }
                            }
                            interactive: false
                        }
                    }
                    Page{
                        ReceiveClaimFrame {
                            id: receiveClaimFrameParent
                        }
                    }
                    Page{
                        ManageClaimsFrame {
                            id: manageClaimsFrameParent
                        }
                    }
                    Page{
                        SearchFrame {
                            id: searchFrameParent
                        }
                    }
                    Page{
                        SettingsFrame {
                            id: settingsFrameParent
                        }
                    }
//                    onWindowChanged: walletStackView.initialItem = walletInfoFrame
                }
            }
            Page {
                id: newWalletFrame
                NewWalletFrame {
                }
            }
            Page {
                id: loadWalletFrame
                LoadWalletFrame {
                }
            }
            Page {
                id: clearWalletFrame
                ClearWalletFrame {
                }
            }
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
        leftMenu.gotoPage(largeIdx, smallIdx)
    }
}
