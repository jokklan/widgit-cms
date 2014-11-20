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
    attributes = $component.data('attributes')
    $component.removeClass 'col-sm-' + attributes.columns

    index         = $target.data 'cut-index'
    columns       = $target.data 'cut-columns'
    count         = $target.data 'cut-columns-count'
    columnsOrigin = attributes.columns
    
    attributes.columns = Math.abs(columnsOrigin - (columns * index))
    newColumns    = columnsOrigin - attributes.columns

    console.log 'index ' + index
    console.log 'cut columns ' + columns
    console.log 'columns attr ' + attributes.columns
    console.log 'count ' + count
    
    #update attributes and class
    $component.addClass 'col-sm-' + attributes.columns
    $component.attr('data-attributes', JSON.stringify(attributes))

    half = count / 2

    console.log 'half ' + half

    if newColumns >= half
      $component.before '<div class="component col-sm-' + newColumns + '">new column before</div>'
    else
      $component.after '<div class="component col-sm-' + newColumns + '">new column after</div>'

    ###
    $.ajax
      url: "/admin/blocks/new",
      method: 'GET'
      dataType: 'html'
      data: { block: { components_attributes: [{ type: attributes.type, columns: newColumns }] } }
      success: (data) ->
        if index > (count / 2)
          $component.before data
        else
          $component.after data
    ###       
    
$(document).ready ->
  window.grideditor = new GridEditor()
