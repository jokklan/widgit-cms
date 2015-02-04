'use strict'
$ = jQuery

# CLASS DEFINITION
class LinkEditor extends BaseEditor
  editorName: 'link'

$(document).on 'page:change', ->
  $('[data-input="link"]').editor(LinkEditor)
