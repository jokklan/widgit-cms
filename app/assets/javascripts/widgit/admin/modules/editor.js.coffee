'use strict'
$ = jQuery

# CLASS DEFINITION
class Editor extends BaseModule
  init: ->
    @$dialog = $('[data-init="dialog"]')

    $(document).on 'click', '[data-toggle="save"]', =>
      @save()

    $(document).on 'click', '[data-toggle="block-dialog"]', (event)=>
      @$dialog.dialog('open', 'block')

    $(document).on 'click', '[data-toggle="add-block"]', (event)=>
      @addBlock(event.currentTarget)

    $(document).on 'click', '[data-toggle="off-canvas"]', =>
      @toggleSidePanel()

  save: ->
    window.page.save()
    alert "Saved!"

  addBlock: (btn)->
    columns_layout = $(btn).data('columns')

    $.ajax
      url: "/admin/blocks/new",
      method: 'GET'
      data: { block: { columns_layout: columns_layout } }

  toggleSidePanel: ->
    $('.off-canvas').toggleClass('active')
    $('body').toggleClass('offcanvas-active')

$(document).ready ->
  window.editor = new Editor()
