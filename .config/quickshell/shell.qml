//@ pragma UseQApplication
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  property color colBg: "#282828"
  property color colFg: "#ebdbb2"
  property color colMuted: "#665c54"
  property color colCyan: "#83a598"
  property color colBlue: "#458588"
  property color colYellow: "#fabd2f"
  property color colRed: "#cc241d"
  property color colGreen: "#98971a"
  property color colOrange: "#fe8019"

  property string fontFamily: "JetbrainsMono Nerd Font"
  property int fontSize: 13
  property int bubbleRadius: 12

  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  PwObjectTracker {
    objects: [root.sink, root.source]
  }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: barWindow

      required property var modelData
      screen: modelData

      anchors.top: true
      anchors.left: true
      anchors.right: true
      implicitHeight: 40
      color: "transparent"

      RowLayout {
        anchors.fill: parent
        anchors.margins: 6
        spacing: 6

        // workspaces
        Rectangle {
          color: root.colBg
          radius: root.bubbleRadius
          implicitWidth: wsRow.implicitWidth + 16
          implicitHeight: 30

          RowLayout {
            id: wsRow
            anchors.centerIn: parent
            spacing: 8

            Repeater {
              model: {
                const occupiedIds = Hyprland.workspaces.values.map(w => w.id);
                const currentId = Hyprland.focusedWorkspace?.id ?? 1;

                const activeSet = new Set([...occupiedIds, currentId]);

                return Array.from(activeSet).sort((a, b) => a - b);
              }

              Text {
                required property int modelData

                property bool isActive: Hyprland.focusedWorkspace?.id === modelData
                property var ws: Hyprland.workspaces.values.find(w => w.id === modelData)

                text: modelData
                color: isActive ? root.colCyan : (ws ? root.colFg : root.colMuted)
                font { family: root.fontFamily; pixelSize: root.fontSize; bold: isActive }

                MouseArea {
                  anchors.fill: parent
                  onClicked: Hyprland.dispatch("workspace " + parent.modelData)
                }
              }
            }
          }
        }

        // window title
        Rectangle {
          Layout.fillWidth: true
          implicitHeight: 30
          color: root.colBg
          radius: root.bubbleRadius
          visible: (Hyprland.activeToplevel?.title ?? "") !== ""

          RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            Text {
              id: windowTitle
              Layout.fillWidth: true
              elide: Text.ElideRight
              text: Hyprland.activeToplevel?.title ?? ""
              color: root.colFg
              font { family: root.fontFamily; pixelSize: root.fontSize; bold: false }
            }
          }
        }

        Item {
          Layout.fillWidth: true
          visible: !windowTitle.parent.visible
        }

        // system tray
        Rectangle {
          color: root.colBg
          radius: root.bubbleRadius
          implicitWidth: trayRow.implicitWidth + 16
          implicitHeight: 30
          visible: SystemTray.items.values.length > 0

          RowLayout {
            id: trayRow
            anchors.centerIn: parent
            spacing: 4

            Repeater {
              model: SystemTray.items

              Item {
                id: trayItem
                implicitWidth: 20
                implicitHeight: 20

                QsMenuAnchor {
                  id: menuAnchor
                  anchor.window: barWindow

                  menu: modelData.menu
                }

                IconImage {
                  anchors.fill: parent
                  source: modelData.icon

                  MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton

                    onClicked: (mouse) => {
                      if (mouse.button === Qt.RightButton) {
                        if (modelData.hasMenu && menuAnchor.menu) {
                          menuAnchor.open();
                        } else {
                          modelData.display();
                        }
                      } else if (mouse.button === Qt.LeftButton) {
                        modelData.activate();
                      }
                    }
                  }
                }
              }
            }
          }
        }

        // volume control
        Rectangle {
          color: root.colBg
          radius: root.bubbleRadius
          implicitWidth: audioRow.implicitWidth + 16
          implicitHeight: 30

          RowLayout {
            id: audioRow
            anchors.centerIn: parent
            spacing: 10

            Text {
              property bool isMuted: root.sink?.audio?.muted ?? false
              property int volPercent: Math.round((root.sink?.audio?.volume ?? 0) * 100)

              text: isMuted ? "  " : "   " + volPercent + "%"
              color: isMuted ? root.colMuted : root.colGreen
              font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }

              MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onClicked: {
                  if (root.sink?.audio) root.sink.audio.muted = !root.sink.audio.muted
                }
                onWheel: (wheel) => {
                  if (root.sink?.audio) {
                    let step = wheel.angleDelta.y > 0 ? 0.05 : -0.05
                    root.sink.audio.volume = Math.max(0.0, Math.min(1.5, root.sink.audio.volume + step))
                  }
                }
              }
            }

            Rectangle { width: 1; height: 12; color: root.colMuted }

            Text {
              property bool isMuted: root.source?.audio?.muted ?? false
              property int micPercent: Math.round((root.source?.audio?.volume ?? 0) * 100)

              text: isMuted ? "  " : " " + micPercent + "% "
              color: isMuted ? root.colRed : root.colCyan
              font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }

              MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onClicked: {
                  if (root.source?.audio) root.source.audio.muted = !root.source.audio.muted
                }
                onWheel: (wheel) => {
                  if (root.source?.audio) {
                    let step = wheel.angleDelta.y > 0 ? 0.05 : -0.05
                    root.source.audio.volume = Math.max(0.0, Math.min(2, root.source.audio.volume + step))
                  }
                }
              }
            }
          }
        }

        // clock
        Rectangle {
          color: root.colBg
          radius: root.bubbleRadius
          implicitWidth: clockText.implicitWidth + 16
          implicitHeight: 30

          Text {
            id: clockText
            anchors.centerIn: parent
            color: root.colOrange
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
            text: Qt.formatDateTime(new Date(), " ddd, MMM dd - HH:mm:ss ")

            Timer {
              interval: 1000
              running: true
              repeat: true
              onTriggered: clockText.text = Qt.formatDateTime(new Date(), " ddd, MMM dd - HH:mm:ss ")
            }
          }
        }
      }
    }
  }
}
