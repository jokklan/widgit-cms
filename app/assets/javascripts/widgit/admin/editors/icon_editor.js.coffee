'use strict'
$ = jQuery

# CLASS DEFINITION
class IconEditor extends BaseEditor
  editorName: 'icon'
  dialog: true

$(document).on 'page:change', ->
  $('[data-input="icon"]').editor(IconEditor)
