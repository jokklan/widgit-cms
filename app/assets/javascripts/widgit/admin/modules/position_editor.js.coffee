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
      disabled: true
    @$componentsContainers.sortable
      connectWith: @$componentsContainers
      items: '> [data-resource="component"]'
      disabled: true

  toggle: ->
    if @reordering
      @stopReorder()
      @reordering = false
    else
      @startReorder()
      @reordering = true

  startReorder: ->
    @$sortableContainers.sortable('enable')
    @$sortables.addClass('draggable')

  stopReorder: ->
    @$sortables.removeClass('draggable')
    @$sortableContainers.sortable('disable')

    @saveItems @$blocksContainer, 'Block'
    @$componentsContainers.each (index, block)=>
      $block = $(block)
      @saveItems $block, 'Component',

  saveItems: ($element, type) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    items.each (index, item) =>
      $(item).resource('update', 'position', index)


# DATA-API
$(document).ready ->
  window.positionEditor = new PositionEditor()
