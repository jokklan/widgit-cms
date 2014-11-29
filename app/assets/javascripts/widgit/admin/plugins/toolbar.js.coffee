'use strict'
$ = jQuery

# CLASS DEFINITION
class Toolbar extends BasePlugin
  constructor: (el, options) ->
    @$toolbar = $(el)
    @$currentTile = null

    super(el, options)

  init: ->
    $(document).on 'mouseenter', '[data-resource="tile"]', (event)=>
      @show(event.currentTarget)

    $(document).on 'click', '[data-toggle="add-component"]', (event)=>
      @addComponent(event.currentTarget)

    $(document).on 'click', '[data-toggle="remove"]', (event)=>
      @remove()

    $(document).on 'click', '[data-editor="save-tile"]', (event)=>
      @saveTile()

    $(document).on 'click', '[data-editor="insert-tile"]', (event)=>
      @insertTile()

  show: (object)->
    @$currentTile = $(object)
    offset = @$currentTile.offset()

    @$toolbar.css
      left: offset.left
      top: offset.top + @$currentTile.height()

    @$toolbar.removeClass('hide')

  addComponent: (btn)->
    type = $(btn).data('type')

    $.ajax
      url: "/admin/components/new",
      method: 'GET',
      data: { component: { type: type }, target_id: @$currentTile.resource('id') }

  remove: ->
    @$currentTile.addClass('hide')
    @$currentTile.resource('update', '_destroy', true)

  saveTile: ->
    @$currentTile.resource('save')

  insertTile: ->
    id = 5

    request = $.ajax
      url: "/admin/tiles/#{id}",
      method: 'GET',
      dataType: 'html',

    request.done (data, status, xhr)=>
        @$currentTile.closest('[data-resource="column"]').resource('update', 'tile_id', id)
        @$currentTile.replaceWith data



# DATA-API
BasePlugin.addPlugin
  name: 'toolbar'
  klass: Toolbar
  selector: '[data-init="toolbar"]'
