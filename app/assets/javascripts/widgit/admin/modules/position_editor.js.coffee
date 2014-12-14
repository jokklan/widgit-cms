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
      beforeStop: (event, ui) =>
        @addComponent ui.item, $(event.target)
      update: =>
        @saveItems @$blocksContainer, 'Block'

        @$componentsContainers.each (index, block)=>
          $block = $(block)
          @saveItems $block, 'Component'

  addComponent: ($component, $tile) ->
    if $tile.attr('data-disabled') != undefined && $component.attr('data-disabled') != undefined
      $tile.html $component.clone()

      newId = new Date().getTime()
      $component.removeAttr('data-disabled')
      $component.removeData('disabled')
      $component.data('id', newId)
      $component.resource()

  saveItems: ($element, type) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    items.each (index, item) =>
      $(item).resource('update', 'position', index)


# DATA-API
$(document).ready ->
  window.positionEditor = new PositionEditor()
