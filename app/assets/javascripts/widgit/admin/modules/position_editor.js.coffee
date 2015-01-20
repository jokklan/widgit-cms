'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor extends BaseModule
  reordering: false

  refresh: (options) ->
    @$blocksContainer = $('[data-editor="position"]')
    @$componentsContainers = $('[data-resource="tile"]')
    @$sortableContainers = @$componentsContainers.add(@$blocksContainer)
    @$blocks = $('[data-resource="block"]')
    @$components = $('[data-resource="component"]')
    @$sortables = @$components.add(@$blocks)

  init: (echo) ->
    super()

    @$blocksContainer.sortable
      items: '> [data-resource="block"]'
      delay: 150
    @$componentsContainers.sortable
      connectWith: @$componentsContainers
      items: '> [data-resource="component"]'
      delay: 150
      update: =>
        @saveItems @$blocksContainer, 'Block'

        @$componentsContainers.each (index, block)=>
          $block = $(block)
          @saveItems $block, 'Component'

    $(document).on 'click', '[data-toggle="drag-boxes"]', =>
      @showDragBoxes()          

  saveItems: ($element, type) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    items.each (index, item) =>
      $(item).resource('update', 'position', index)

  showDragBoxes: ->
    $body    = $('body') 

    if $body.hasClass 'drag-boxes'
      $body.removeClass 'drag-boxes'
    else
      $body.addClass 'drag-boxes'

# DATA-API
$(document).ready ->
  window.positionEditor = new PositionEditor()
