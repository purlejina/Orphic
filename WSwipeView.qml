import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Global"

SwipeView {
    id: swipeView
    contentItem: ListView {
          model: swipeView.contentModel
          interactive: swipeView.interactive
          currentIndex: swipeView.currentIndex

          spacing: swipeView.spacing
          orientation: swipeView.orientation
          snapMode: ListView.SnapOneItem
          boundsBehavior: Flickable.StopAtBounds

//          highlightRangeMode: ListView.StrictlyEnforceRange
          highlightRangeMode: ListView.NoHighlightRange
          preferredHighlightBegin: 0
          preferredHighlightEnd: 0
          highlightMoveDuration: 10
      }
}
