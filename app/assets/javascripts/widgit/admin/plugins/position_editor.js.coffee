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
      items: '> [data-sortable="item"]'
      disabled: true

  update: (id, position, type)->
    window.pageForm["add#{type}"](id, 'position', position)

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
      @saveItems $(widget_group), 'Widget'

  saveItems: ($element, type) ->
    items = $element.sortable('instance')._getItemsAsjQuery()
    data = []

    $element.sortable('disable')

    items.each (index, item) =>
      id = $(item).data('id')
      @update(id, index, type)

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
