'use strict'
$ = jQuery

# CLASS DEFINITION
class Editor extends BaseModule
  init: ->
    $(document).on 'click', '[data-toggle="save"]', =>
      @save()

    $(document).on 'click', '[data-toggle="reorder"]', =>
      @toggleReorder()

    $(document).on 'click', '[data-toggle="add-block"]', =>
      @addBlock()

  save: ->
    window.page.save()

  toggleReorder: ->
    window.positionEditor.toggle()

  addBlock: ->
    $.ajax
      url: "/admin/widget_groups/new",
      method: 'GET'
      data: { widget_group: { widgets_attributes: [{ type: 'Widgit::Widgets::Text', text: '', columns: 12 }] } }

$(document).ready ->
  window.editor = new Editor()
