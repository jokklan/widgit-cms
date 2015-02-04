'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BaseEditor
  editorName: 'color'
  dialog: true

$(document).on 'page:change', ->
  $('[data-input="color"]').editor(ColorEditor)
