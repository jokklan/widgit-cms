'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BaseEditor
  editorName: 'color'

  updateDomElement: ($element, data) ->
    $element
      .removeClassPrefix 'color-'
      .addClass "color-#{data.color}"
