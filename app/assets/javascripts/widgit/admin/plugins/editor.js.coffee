'use strict'
$ = jQuery

# CLASS DEFINITION
Editor = {
  save: ->
    window.pageForm.submit();
}

# DATA-API
window.Editor = Editor

$(document).on 'click', '[data-toggle="save"]', ->
  Editor.save()
