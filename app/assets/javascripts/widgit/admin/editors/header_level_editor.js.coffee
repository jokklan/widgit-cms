'use strict'
$ = jQuery

# CLASS DEFINITION
class HeaderLevelEditor extends BaseEditor
  editorName: 'header_level'

  updateDomElement: ($element, data) ->
    $header = $element.find(':header')
    html = $header.html()
    newHeader = $("<h#{data.level}>")
    newHeader.html(html)

    $header.replaceWith(newHeader)

  attributeName: ->
    'level'

$(document).ready ->
  window.headerLevelEditor = new HeaderLevelEditor()
