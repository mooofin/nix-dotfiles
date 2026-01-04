import QtQuick
import Quickshell
import qs.Commons
import qs.Modules.Bar.Extras
import qs.Services.UI
import qs.Widgets

// Bar Widget Component
NIconButton {
  id: root

  property var pluginApi: null

  // Required properties for bar widgets
  property ShellScreen screen
  property string widgetId: ""
  property string section: ""

  icon: "rocket"
  tooltipText: pluginApi?.tr("tooltip.open-launcher") || "Open Launcher"
  tooltipDirection: BarService.getTooltipDirection()
  baseSize: Style.capsuleHeight
  applyUiScale: false
  density: Settings.data.bar.density
  customRadius: Style.radiusL
  colorBg: Style.capsuleColor
  colorFg: Color.mOnSurface
  colorBorder: Color.transparent
  colorBorderHover: Color.transparent

  onClicked: {
    if (screen) {
      var launcherPanel = PanelService.getPanel("launcherPanel", screen);
      if (launcherPanel) {
        launcherPanel.toggle();
        launcherPanel.setSearchText("");
      }
    }
  }
}

