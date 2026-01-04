import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets

Rectangle {
  id: root

  property var pluginApi: null
  property ShellScreen screen
  property string widgetId: ""
  property string section: ""

  // Standard capsule dimensions
  implicitWidth: barIsVertical ? Style.capsuleHeight : contentRow.implicitWidth + Style.marginM * 2
  implicitHeight: Style.capsuleHeight
  
  readonly property string barPosition: Settings.data.bar.position || "top"
  readonly property bool barIsVertical: barPosition === "left" || barPosition === "right"
  
  // Settings
  readonly property bool showCount: pluginApi?.pluginSettings?.showCountInBar ?? true
  
  function getIntValue(value, defaultValue) {
    return (typeof value === 'number') ? Math.floor(value) : defaultValue;
  }

  readonly property int noteCount: getIntValue(pluginApi?.pluginSettings?.count, 0)
  
  color: Style.capsuleColor
  radius: Style.radiusL

  RowLayout {
    id: contentRow
    anchors.centerIn: parent
    spacing: Style.marginS

    NIcon {
      icon: "paperclip" 
      applyUiScale: false
      color: mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
    }

    NText {
      visible: !barIsVertical && root.showCount
      text: root.noteCount.toString()
      color: mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
      font.pointSize: Style.fontSizeS
      font.weight: Font.Medium
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor

    onEntered: {
      root.color = Color.mHover;
    }

    onExited: {
      root.color = Style.capsuleColor;
    }

    onClicked: {
      if (pluginApi) {
        pluginApi.openPanel(root.screen);
      }
    }
  }
}
