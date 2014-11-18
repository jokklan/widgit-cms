'use strict'
$ = jQuery

# CLASS DEFINITION
class GridEditor extends BaseModule
  
  init: ->
    gridActive  = false
    clickStart  = false
    clickPress  = true

    $(document).on 'click', '[data-toggle="grid-editor"]', (event) =>      
      if !gridActive
        @gridActive($(event.currentTarget))
        gridActive = true
      else
        @gridInActive($(event.currentTarget))
        gridActive = false

    $(document).on 'mousedown touchstart', '[data-resource="component"]', (event) =>
      if gridActive
        delay = (ms, func) -> setTimeout func, ms

        clickStart  = true
        clickPress  = false

        delay 500, =>
          if clickStart
            clickPress  = true

            @$startTarget = $(event.target)
            @tilePressed($(event.currentTarget))

            console.log 'mousestart clickpress'
            console.dir event

    $(document).on 'mouseup touchend', '[data-resource="component"]', (event) =>
      if gridActive

        clickStart = false
        $('.tile-active').removeClass 'tile-active'

        if clickPress
          @mergeColumns($(event.target))

          console.log 'mouseend clickpress'
          console.dir event

    $(document).on 'click', '[data-resource="component"]', (event) =>
      if gridActive
        if gridActive && !clickPress
          @tileClicked($(event.currentTarget)) 
          console.log 'clicked'      

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

  tileClicked: ($target)->
    attributes = $target.data('attributes')
    $target.removeClass 'col-sm-' + attributes.columns

    attributes.columns = attributes.columns/2

    $target.attr('data-attributes', JSON.stringify(attributes))
    $target.addClass 'col-sm-' + attributes.columns
    $target.clone().prependTo($target.parent());

  tilePressed: ($target) ->
    $target.addClass 'tile-active'

  mergeColumns: ($endTarget) ->
    if $endTarget.hasClass('component')
      $endTarget.remove()
    else
      $endTarget.closest('.component').remove()  

    attributes = @$startTarget.data('attributes')
    @$startTarget.removeClass 'col-sm-' + attributes.columns

    attributes.columns = attributes.columns * 2

    @$startTarget.attr('data-attributes', JSON.stringify(attributes))
    @$startTarget.addClass 'col-sm-' + attributes.columns    



$(document).ready ->
  window.grideditor = new GridEditor()
