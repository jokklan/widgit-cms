'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BaseEditor
  editorName: 'color'
  dialog: true

  updateDomElement: ($element, data) ->
    $element
      .removeClassPrefix 'color-'
      .addClass "color-#{data.color}"

$(document).ready ->
  window.colorEditor = new ColorEditor()
