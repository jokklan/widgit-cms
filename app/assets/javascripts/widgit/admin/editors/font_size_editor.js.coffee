'use strict'
$ = jQuery

# CLASS DEFINITION
class FontSizeEditor extends BaseEditor
  editorName: 'font_size'

  updateDomElement: ($element, data) ->
    $text = $element.find('p')

    $text
      .removeClassPrefix "font-size-"
      .addClass "font-size-#{data.font_size}"

  attributeName: ->
    'font_size'

$(document).ready ->
  window.fontSizeEditor = new FontSizeEditor()