import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.Commons
import qs.Services.UI
import qs.Widgets

Item {
  id: root

  property var pluginApi: null
  readonly property var geometryPlaceholder: panelContainer
  property real contentPreferredWidth: 700 * Style.uiScaleRatio
  property real contentPreferredHeight: 500 * Style.uiScaleRatio
  readonly property bool allowAttach: true
  anchors.fill: parent

  // State
  property string viewMode: "list" // "list" or "edit"
  property var currentNote: null // Object { id, title, content, modifiedAt }
  property ListModel notesModel: ListModel {}

  Component.onCompleted: {
    if (pluginApi) {
      loadNotes();
    }
  }

  // Reload notes when api changes or external updates happen
  onPluginApiChanged: {
    if (pluginApi) loadNotes();
  }

  function loadNotes() {
    notesModel.clear();
    var notes = pluginApi?.pluginSettings?.notes || [];
    // Sort by modification date descending
    notes.sort((a, b) => new Date(b.modifiedAt) - new Date(a.modifiedAt));
    
    for (var i = 0; i < notes.length; i++) {
      notesModel.append(notes[i]);
    }
  }

  function createNote() {
    root.currentNote = {
      id: null,
      title: "",
      content: "",
      modifiedAt: new Date().toISOString()
    };
    root.viewMode = "edit";
  }

  function editNote(noteId) {
    var notes = pluginApi?.pluginSettings?.notes || [];
    var note = notes.find(n => n.id === noteId);
    if (note) {
      // Clone to avoid direct mutation
      root.currentNote = {
        id: note.id,
        title: note.title,
        content: note.content,
        modifiedAt: note.modifiedAt
      };
      root.viewMode = "edit";
    }
  }

  function saveCurrentNote(title, content) {
    if (!pluginApi) return;
    
    var notes = pluginApi.pluginSettings.notes || [];
    var now = new Date().toISOString();
    
    if (root.currentNote.id === null) {
      // New note
      var newNote = {
        id: Date.now().toString(),
        title: title || "Untitled Note",
        content: content,
        modifiedAt: now
      };
      notes.push(newNote);
    } else {
      // Update existing
      var idx = notes.findIndex(n => n.id === root.currentNote.id);
      if (idx >= 0) {
        notes[idx].title = title || "Untitled Note";
        notes[idx].content = content;
        notes[idx].modifiedAt = now;
      }
    }
    
    pluginApi.pluginSettings.notes = notes;
    pluginApi.pluginSettings.count = notes.length;
    pluginApi.saveSettings();
    loadNotes();
    root.viewMode = "list";
    root.currentNote = null;
  }

  function deleteNote(noteId) {
    if (!pluginApi) return;
    
    var notes = pluginApi.pluginSettings.notes || [];
    var idx = notes.findIndex(n => n.id === noteId);
    if (idx >= 0) {
      notes.splice(idx, 1);
      pluginApi.pluginSettings.notes = notes;
      pluginApi.pluginSettings.count = notes.length;
      pluginApi.saveSettings();
      loadNotes();
    }
  }

  function deleteCurrentNote() {
      if (root.currentNote && root.currentNote.id) {
          deleteNote(root.currentNote.id);
      }
      root.viewMode = "list";
      root.currentNote = null;
  }

  Rectangle {
    id: panelContainer
    anchors.fill: parent
    color: Color.transparent

    ColumnLayout {
      anchors.fill: parent
      anchors.margins: Style.marginM
      spacing: Style.marginL

      // Header
      Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: Color.mSurfaceVariant
        radius: Style.radiusL

        // LIST VIEW
        ColumnLayout {
          anchors.fill: parent
          anchors.margins: Style.marginM
          visible: root.viewMode === "list"
          spacing: Style.marginM

          RowLayout {
            spacing: Style.marginM
            
            NIcon {
              icon: "sticky-note"
              pointSize: Style.fontSizeL
            }

            NText {
              text: pluginApi?.tr("panel.header.title") || "Notes"
              font.pointSize: Style.fontSizeL
              font.weight: Font.Medium
              color: Color.mOnSurface
            }
            Item { Layout.fillWidth: true }
            NButton {
              text: pluginApi?.tr("panel.header.add_button") || "New Note"
              icon: "plus"
              onClicked: createNote()
            }
          }

          // Empty State
          Item {
              Layout.fillWidth: true
              Layout.fillHeight: true
              visible: notesModel.count === 0
              
              NText {
                text: pluginApi?.tr("panel.list.empty_message") || "No notes yet"
                color: Color.mOnSurfaceVariant
                anchors.centerIn: parent
                font.pointSize: Style.fontSizeM
              }
          }

          // List
          ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: notesModel.count > 0
            clip: true

            ListView {
              id: notesList
              model: root.notesModel
              spacing: Style.marginS
              boundsBehavior: Flickable.StopAtBounds
              flickableDirection: Flickable.VerticalFlick
              
              delegate: Rectangle {
                width: ListView.view.width
                height: cardContent.implicitHeight + Style.marginM * 2
                color: Color.mSurface
                radius: Style.radiusS
                
                // Hover effect
                property bool hovered: false

                MouseArea {
                  anchors.fill: parent
                  hoverEnabled: true
                  cursorShape: Qt.PointingHandCursor
                  onEntered: parent.hovered = true
                  onExited: parent.hovered = false
                  onClicked: editNote(model.id)
                }

                RowLayout {
                    id: cardContent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: Style.marginM
                    spacing: Style.marginM

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: Style.marginS
                        
                        RowLayout {
                             Layout.fillWidth: true
                             spacing: Style.marginS
                             NText {
                                text: model.title
                                font.weight: Font.Medium
                                font.pointSize: Style.fontSizeM
                                color: parent.parent.parent.hovered ? Color.mPrimary : Color.mOnSurface
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                              }

                              NText {
                                text: new Date(model.modifiedAt).toLocaleDateString()
                                font.pointSize: Style.fontSizeS
                                color: Color.mOnSurfaceVariant
                              }
                        }

                        // Preview content (one line)
                        NText {
                            text: model.content.replace(/\n/g, " ")
                            font.pointSize: Style.fontSizeS
                            color: Color.mOnSurfaceVariant
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                            maximumLineCount: 1
                        }
                    }

                    // Delete button on the right
                    NIconButton {
                        id: deleteButton
                        icon: "circle-x"
                        tooltipText: pluginApi?.tr("panel.editor.delete_button") || "Delete"
                        color: Color.mError
                        implicitWidth: Style.baseWidgetSize * 0.8
                        implicitHeight: Style.baseWidgetSize * 0.8
                        radius: Style.radiusM
                        opacity: 0.7
                        
                        onEntered: opacity = 1.0
                        onExited: opacity = 0.7
                        onClicked: deleteNote(model.id)
                    }
                }
              }
            }
          }
        }

        // EDIT VIEW
        ColumnLayout {
          anchors.fill: parent
          anchors.margins: Style.marginM
          visible: root.viewMode === "edit"
          spacing: Style.marginM

          // Toolbar
          RowLayout {
            spacing: Style.marginS
            
            NIconButton {
              icon: "arrow-left"
              onClicked: {
                root.viewMode = "list";
                root.currentNote = null;
              }
            }
            
            NText {
              text: root.currentNote && root.currentNote.id ? "Edit Note" : "New Note"
              font.pointSize: Style.fontSizeL
              font.weight: Font.Medium
              color: Color.mOnSurface
            }
            
            Item { Layout.fillWidth: true }
            
            NButton {
              text: pluginApi?.tr("panel.editor.delete_button") || "Delete"
              visible: root.currentNote && root.currentNote.id !== null
              color: Color.mError
              onClicked: deleteCurrentNote()
            }
            
            NButton {
              text: pluginApi?.tr("panel.editor.save_button") || "Save"
              onClicked: saveCurrentNote(titleInput.text, contentInput.text)
            }
          }

          // Editor Fields
          NTextInput {
            id: titleInput
            Layout.fillWidth: true
            placeholderText: pluginApi?.tr("panel.editor.title_placeholder") || "Title"
            text: root.currentNote ? root.currentNote.title : ""
          }

          Rectangle {
              Layout.fillWidth: true
              Layout.fillHeight: true
              color: Color.mSurface
              radius: Style.radiusM
              
              ScrollView {
                anchors.fill: parent
                anchors.margins: Style.marginS
                
                TextArea {
                    id: contentInput
                    width: parent.width
                    placeholderText: pluginApi?.tr("panel.editor.content_placeholder") || "Content"
                    placeholderTextColor: Color.mOnSurfaceVariant
                    text: root.currentNote ? root.currentNote.content : ""
                    wrapMode: TextEdit.Wrap
                    color: Color.mOnSurface
                    font.pointSize: Style.fontSizeM
                    background: null // Remove default background
                    selectByMouse: true
                }
            }
          }
        }
      }
    }
  }
}
