'use strict'
$ = jQuery

# CLASS DEFINITION
class Editor extends BaseModule
  init: ->
    $(document).on 'click', '[data-toggle="save"]', =>
      @save()

    $(document).on 'click', '[data-toggle="add-block"]', (event)=>
      @addBlock(event.target)

    $(document).on 'click', '[data-toggle="off-canvas"]', =>
      @toggleSidePanel()
      $offCanvas  = $('.off-canvas')

  save: ->
    window.page.save()
    alert "Saved!"

  addBlock: (btn)->
    $.ajax
      url: "/admin/blocks/new",
      method: 'GET'
      data: { block: { columns_attributes: [{ columns: 12 }] } }

  toggleSidePanel: ->
    $('.off-canvas').toggleClass('active')

$(document).ready ->
  window.editor = new Editor()
