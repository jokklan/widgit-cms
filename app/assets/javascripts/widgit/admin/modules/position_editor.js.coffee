'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor extends BaseModule
  reordering: false

  refresh: (options) ->
    @$widgetGroupsContainer = $('[data-editor="position"]')
    @$widgetsContainers = $('[data-type="widget_group"]')
    @$sortableContainers = @$widgetsContainers.add(@$widgetGroupsContainer)
    @$sortables = $('[data-sortable="item"]')

  init: (echo) ->
    super()

    @$widgetGroupsContainer.sortable
      items: '> [data-sortable="item"]'
      disabled: true
    @$widgetsContainers.sortable
      connectWith: @$widgetsContainers
      items: '> [data-sortable="item"]'
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

    @saveItems @$widgetGroupsContainer, 'WidgetGroup'
    @$widgetsContainers.each (index, widget_group)=>
      $widget_group = $(widget_group)
      @saveItems $widget_group, 'Widget', $widget_group.data('id')

  saveItems: ($element, type, groupId) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    items.each (index, item) =>
      id = $(item).data('id')
      window.pageForm["add#{type}"](id, 'position', index)

      if groupId
        window.pageForm["add#{type}"](id, 'widget_group_id', groupId)

# DATA-API
$(document).ready ->
  window.positionEditor = new PositionEditor()
