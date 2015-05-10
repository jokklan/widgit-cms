'use strict'
$ = jQuery

# CLASS DEFINITION
class Editor extends BaseModule
  init: ->
    @$dialog = $('[data-init="dialog"]')

    @delegateClicks()
    @delegateKeys()
    @toggleSidePanel()


  delegateClicks: ->
    $(document).on 'click', '[data-toggle="save"]', =>
      @save()

    $(document).on 'click', '[data-toggle="block-dialog"]', (event)=>
      @$dialog.dialog('open', 'block')

    $(document).on 'click', '[data-toggle="add-block"]', (event)=>
      @addBlock(event.currentTarget)

    $(document).on 'click', '[data-toggle="side-panel"]', =>
      @toggleSidePanel()

    $(document).on 'click', '[data-toggle="toolbar"]', =>
      @toggleToolbar()

  delegateKeys: ->
    Mousetrap.bind ['ctrl+s', 'meta+s'], (event) =>
      event.preventDefault
      @save()

    Mousetrap.bind 'q', (event) =>
      @toggleSidePanel()

    Mousetrap.bind 'w', (event) =>
      @toggleToolbar()

  save: ->
    window.page.save()

  addBlock: (btn)->
    columns_layout = $(btn).data('columns')

    $.ajax
      url: "/admin/blocks/new",
      method: 'GET'
      data: { block: { columns_layout: columns_layout } }

  toggleSidePanel: ->
    $sidePanel   = $('[data-side-panel]')
    $pageWrapper = $('[data-page-wrapper]')

    if $sidePanel.hasClass('active')
      styling = {"max-width" : "none" }
    else
      contentWidth = $(window).width() - $sidePanel.outerWidth()
      styling      = {"max-width" : "#{contentWidth}px"}

    $sidePanel.toggleClass('active')
    $pageWrapper.toggleClass('side-panel-active')
    
    $.delay 500, ->
      $pageWrapper.css styling
      $(".container").css styling    

  toggleToolbar: ->
    $('body').toggleClass 'built-mode'


$(document).ready ->
  window.editor = new Editor()
