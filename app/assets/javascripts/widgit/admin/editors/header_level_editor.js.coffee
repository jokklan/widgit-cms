'use strict'
$ = jQuery

# CLASS DEFINITION
class HeaderLevelEditor extends BaseEditor
  editorName: 'header_level'

  attributeName: ->
    'level'

$(document).on 'page:change', ->
  $('[data-input="header_level"]').editor(HeaderLevelEditor)
