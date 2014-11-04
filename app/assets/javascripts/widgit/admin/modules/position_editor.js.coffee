'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor extends BaseModule
  reordering: false

  refresh: (options) ->
    @$widgetGroupsContainer = $('[data-editor="position"]')
    @$widgetsContainers = $('[data-type="widget_group"]')
    @$sortableContainers = @$widgetsContainers.add(@$widgetGroupsContainer)
    @$widgetGroups = $('[data-resource="widget-group"]')
    @$widgets = $('[data-resource="widget"]')
    @$sortables = @$widgets.add(@$widgetGroups)

  init: (echo) ->
    super()

    @$widgetGroupsContainer.sortable
      items: '> [data-resource="widget-group"]'
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

    @saveItems @$widgetGroupsContainer, 'WidgetGroup'
    @$widgetsContainers.each (index, widget_group)=>
      $widget_group = $(widget_group)
      @saveItems $widget_group, 'Widget',

  saveItems: ($element, type) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    items.each (index, item) =>
      $(item).resource('update', 'position', index)

      if widgetGroupId = $element.data('id')
        $(item).resource('update', 'widget_group_id', widgetGroupId)


# DATA-API
$(document).ready ->
  window.positionEditor = new PositionEditor()
