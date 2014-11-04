'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor
  reordering: false

  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)
    @$widgetGroups = @$el.find('[data-type="widget_group"]')

    @init()

  init: (echo) ->
    @$el.sortable
      items: '> [data-sortable="item"]'
      disabled: true
    @$widgetGroups.sortable
      connectWith: @$widgetGroups
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
    @$el.sortable('enable')
    @$widgetGroups.sortable('enable')

  stopReorder: ->
    @saveItems @$el, 'WidgetGroup'
    @$widgetGroups.each (index, widget_group)=>
      $widget_group = $(widget_group)
      @saveItems $widget_group, 'Widget', $widget_group.data('id')

  saveItems: ($element, type, groupId) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    $element.sortable('disable')

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
