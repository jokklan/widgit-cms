'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BaseEditor
  editorName: 'color'
  dialog: true

$(document).ready ->
  window.colorEditor = new ColorEditor()
