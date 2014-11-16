'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor extends BaseModule
  reordering: false

  refresh: (options) ->
    @$widgetGroupsContainer = $('[data-editor="position"]')
    @$widgetsContainers = $('[data-type="block"]')
    @$sortableContainers = @$widgetsContainers.add(@$widgetGroupsContainer)
    @$widgetGroups = $('[data-resource="block"]')
    @$widgets = $('[data-resource="widget"]')
    @$sortables = @$widgets.add(@$widgetGroups)

  init: (echo) ->
    super()

    @$widgetGroupsContainer.sortable
      items: '> [data-resource="block"]'
      disabled: true
    @$widgetsContainers.sortable
      connectWith: @$widgetsContainers
      items: '> [data-resource="widget"]'
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

    @saveItems @$widgetGroupsContainer, 'Block'
    @$widgetsContainers.each (index, block)=>
      $block = $(block)
      @saveItems $block, 'Widget',

  saveItems: ($element, type) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    items.each (index, item) =>
      $(item).resource('update', 'position', index)

      if widgetGroupId = $element.data('id')
        $(item).resource('update', 'block_id', widgetGroupId)


# DATA-API
$(document).ready ->
  window.positionEditor = new PositionEditor()
