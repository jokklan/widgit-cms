'use strict'
$ = jQuery

# CLASS DEFINITION
class IconEditor extends BaseEditor
  editorName: 'icon'
  dialog: true

$(document).ready ->
  window.iconEditor = new IconEditor()
