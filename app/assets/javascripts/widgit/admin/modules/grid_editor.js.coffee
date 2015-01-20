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
        @gridInactive($(event.currentTarget))
        gridActive = false

    $(document).on 'click', '[data-toggle="cut-grid"]', (event) =>
      if gridActive
        event.preventDefault()
        @cutGrid($(event.currentTarget))

    $(document).on 'click', '[data-toggle="merge-grid"]', (event) =>
      if gridActive
        event.preventDefault()
        @mergeGrid($(event.currentTarget))      

  gridActive: ($target)->
    @$gridEditor = $('[data-editor-grid]')
    @$textEditor = $('[data-editor="text"]')

    @$gridEditor.addClass('grid-editor-active')
    @$textEditor.attr('contenteditable', false)
    $target.addClass('btn-info')

    @createCutOverlays()
    @createMergeOverlays()    

  gridInactive: ($target)->
    @$gridEditor.removeClass('grid-editor-active')
    @$textEditor.attr('contenteditable', true)
    $target.removeClass('btn-info')

  createCutOverlays: ->
    $('[data-cut-overlay]').remove()

    $columns = $('[data-resource=column]')

    $columns.each ->
      $this           = $(this)
      attributes      = $this.data('attributes')
      columns         = attributes.columns
      overlayColumns  = Math.round(12 / (columns / 2))
      cutmarksCount   = (columns / 2) - 1

      template = '<div class="cut-overlay" data-cut-overlay>'

      for i in [0 ... cutmarksCount]
        cutIndex = i + 1
        template += 
        "
          <div class='col-sm-#{overlayColumns} overlay-column'>
            <a  href='#' 
                class='fa fa-scissors' 
                data-toggle='cut-grid'
                data-cut-index='#{cutIndex}'></a>
          </div>              
        "   
      template += '</div>'

      $this.append template

  createMergeOverlays: ->
    $('[data-toggle="merge-grid"]').remove()

    $block   = $('[data-resource=block]')

    $block.each ->
      $columns = $(this).find('[data-resource=column]')
      length   = $columns.length

      $columns.append '<a href="#" data-toggle="merge-grid" class="merge-overlay"><i class="fa fa-arrows-h"></i></a>' 

      $columns.find('[data-toggle="merge-grid"]').eq(length - 1).remove()

  cutGrid: ($target)->
    $column = $target.closest "[data-resource=column]"  

    attributes    = $column.data 'attributes'
    cutIndex      = $target.data 'cut-index'
    columnStart   = cutIndex * 2
    columnEnd     = attributes.columns - columnStart

    $column
      .removeClass 'col-sm-' + attributes.columns
      .addClass 'col-sm-' + columnStart

    $column.resource('update', 'columns', columnStart)
    
    attributes.columns = columnStart
    $column.attr 'data-attributes', JSON.stringify(attributes)
   
    #Todo: retrieve this with AJAX
    $newColumn = $('<div data-resource="column"></div>')
    $newColumn.addClass "col-sm-#{columnEnd}"
    $newColumn.attr 'data-attributes', JSON.stringify({ columns: columnEnd })
    $newColumn.html '<div class="tile" data-editor="components" data-resource="tile">'
    $column.after $newColumn
    # $column.after "<div class='col-sm-#{columnEnd}' data-attributes={'columns':#{columnEnd}} data-resource='column'><div class='tile' data-editor='components' data-resource='tile'></div></div>"

    $(document).trigger('page:update')
    @createCutOverlays()
    @createMergeOverlays()

  mergeGrid: ($target)->
    $leftColumn    = $target.closest "[data-resource=column]"  
    $rightColumn   = $leftColumn.next()
    leftAttributes = $leftColumn.data 'attributes'
    newColumns     = $rightColumn.data('attributes').columns + leftAttributes.columns
    
    $leftColumn
      .removeClass 'col-sm-' + leftAttributes.columns
      .addClass 'col-sm-' + newColumns

    leftAttributes.columns = newColumns
    $leftColumn.attr 'data-attributes', JSON.stringify(leftAttributes)

    $rightColumn.remove()

    @createCutOverlays()
    @createMergeOverlays()

$(document).ready ->
  window.grideditor = new GridEditor()
