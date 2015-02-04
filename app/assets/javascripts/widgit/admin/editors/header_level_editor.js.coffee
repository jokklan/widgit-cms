'use strict'
$ = jQuery

# CLASS DEFINITION
class HeaderLevelEditor extends BaseEditor
  editorName: 'header_level'

  attributeName: ->
    'level'

$(document).ready ->
  window.headerLevelEditor = new HeaderLevelEditor()
