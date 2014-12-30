'use strict'
$ = jQuery

# CLASS DEFINITION
class Editor extends BaseModule
  init: ->
    $(document).on 'click', '[data-toggle="save"]', =>
      @save()

    $(document).on 'click', '[data-toggle="add-block"]', (event)=>
      @addBlock(event.target)

  save: ->
    window.page.save()
    alert "Saved!"

  addBlock: (btn)->
    $.ajax
      url: "/admin/blocks/new",
      method: 'GET'
      data: { block: { columns_attributes: [{ columns: 12 }] } }

$(document).ready ->
  window.editor = new Editor()
