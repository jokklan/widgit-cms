'use strict'
$ = jQuery

# CLASS DEFINITION
class Editor extends BaseModule
  init: ->
    $(document).on 'click', '[data-toggle="save"]', =>
      @save()

    $(document).on 'click', '[data-toggle="reorder"]', =>
      @toggleReorder()

    $(document).on 'click', '[data-toggle="add-component"]', (event)=>
      @addComponent(event.target)

  save: ->
    window.page.save()

  toggleReorder: ->
    window.positionEditor.toggle()

  addComponent: (btn)->
    type = $(btn).data('type')

    $.ajax
      url: "/admin/blocks/new",
      method: 'GET'
      data: { block: { components_attributes: [{ type: type, columns: 12 }] } }

$(document).ready ->
  window.editor = new Editor()
