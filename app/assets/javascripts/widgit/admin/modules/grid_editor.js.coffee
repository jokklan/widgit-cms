'use strict'
$ = jQuery

# CLASS DEFINITION
class GridEditor extends BaseModule
  
  init: ->
    gridActive  = false

    $(document).on 'click', '[data-toggle="grid-editor"]', (event) =>      
      if !gridActive
        @gridActive($(event.currentTarget))
        gridActive = true
      else
        @gridInActive($(event.currentTarget))
        gridActive = false

    $(document).on 'click', '[data-toggle="cut-grid"]', (event) =>
      if gridActive
        if gridActive
          @cutGrid($(event.currentTarget))    

  gridActive: ($target)->
    @$gridEditor = $('[data-editor-grid]')
    @$textEditor = $('[data-editor="text"]')

    @$gridEditor.addClass('grid-editor-active')
    @$textEditor.attr('contenteditable', false)
    $target.addClass('btn-success')

  gridInActive: ($target)->
    @$gridEditor.removeClass('grid-editor-active')
    @$textEditor.attr('contenteditable', true)
    $target.removeClass('btn-success')

  cutGrid: ($target)->
    $component = $target.closest "[data-resource=component]"
    $block     = $target.closest "[data-resource=block]"
    attributes = $component.data('attributes')

    index         = $target.data 'cut-index'
    columns       = $target.data 'cut-columns'
    cutStart      = index * columns
    cutEnd        = 12 - cutStart

    $component.html '<div class="component col-sm-' + cutStart + '">new column before</div>'
    $component.append '<div class="component col-sm-' + cutEnd + '">new column before</div>'

$(document).ready ->
  window.grideditor = new GridEditor()
