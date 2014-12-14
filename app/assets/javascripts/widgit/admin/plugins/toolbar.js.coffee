'use strict'
$ = jQuery

# CLASS DEFINITION
class Toolbar extends BasePlugin
  constructor: (el, options) ->
    @$toolbar = $(el)
    @$currentTile = null

    super(el, options)

  init: ->
    $(document).on 'click', '[data-toggle="remove"]', (event)=>
      @remove()

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
