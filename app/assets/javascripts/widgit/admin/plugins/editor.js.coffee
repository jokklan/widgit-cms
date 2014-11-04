'use strict'
$ = jQuery

# CLASS DEFINITION
Editor = {
  refresh: ->
    @$sortable = $('[data-editor="position"]')
  save: ->
    window.pageForm.submit();
  toggleReorder: ->
    @$sortable.positioneditor('toggle')
}

# DATA-API
window.Editor = Editor

$(document).on 'click', '[data-toggle="save"]', ->
  Editor.save()

$(document).on 'click', '[data-toggle="reorder"]', ->
  Editor.toggleReorder()

$(document).on 'page:change', ->
  Editor.refresh()
