'use strict'
$ = jQuery

# CLASS DEFINITION
Editor = {
  save: ->
    window.pageForm.submit()
  toggleReorder: ->
    window.positionEditor.toggle()
}

# DATA-API
window.Editor = Editor

$(document).on 'click', '[data-toggle="save"]', ->
  Editor.save()

$(document).on 'click', '[data-toggle="reorder"]', ->
  Editor.toggleReorder()
