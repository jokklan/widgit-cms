'use strict'
$ = jQuery

# CLASS DEFINITION
class PositionEditor
  reordering: false

  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)

    @init()

  init: (echo) ->
    @$el.sortable
      items: '> [data-sortable="item"]'
      disabled: true

  update: (id, position)->
    window.pageForm.addWidgetGroup(id, 'position', position)

  toggle: ->
    if @reordering
      @stopReorder()
      @reordering = false
    else
      @startReorder()
      @reordering = true

  startReorder: ->
    @$el.sortable('enable')

  stopReorder: ->
    items = @$el.sortable('instance')._getItemsAsjQuery()
    data = []

    @$el.sortable('disable')

    items.each (index, item) =>
      id = $(item).data('id')
      @update(id, index)

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
