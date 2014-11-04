'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor
  reordering: false

  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$widgetGroupsContainer = $(el)
    @$widgetsContainers = $('[data-type="widget_group"]')
    @$sortableContainers = @$widgetsContainers.add(@$widgetGroupsContainer)
    @$sortables = $('[data-sortable="item"]')

    @init()

  init: (echo) ->
    @$widgetGroupsContainer.sortable
      items: '> [data-sortable="item"]'
      placeholder: 'draggable-placeholder'
      forcePlaceholderSize: true
      disabled: true
    @$widgetsContainers.sortable
      connectWith: @$widgetsContainers
      # placeholder: 'draggable-placeholder'
      items: '> [data-sortable="item"]'
      # forcePlaceholderSize: true
      disabled: true

    console.log @$widgetsContainers.sortable("option", "placeholder")

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

# PLUGIN DEFINITION
$.fn.extend positioneditor: (option, args...) ->
  @each ->
    $this = $(this)
    data = $this.data('positioneditor')

    if !data
      $this.data 'positioneditor', (data = new PositionEditor(this, option))
    if typeof option == 'string'
      data[option].apply(data, args)

# DATA-API
$(document).on 'page:change', ->
  $('[data-editor="position"]').positioneditor()
