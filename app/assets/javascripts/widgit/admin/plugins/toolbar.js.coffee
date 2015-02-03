'use strict'
$ = jQuery

# CLASS DEFINITION
class Toolbar extends BasePlugin
  constructor: (el, options) ->
    @$toolbar = $(el)
    @$currentTile = null

    super(el, options)

  refresh: (options) ->
    @$componentsContainers = $('[data-toolbar="component"]')
    @$tiles = $('[data-resource="tile"]')

  init: ->
    super()

    @$componentsContainers.sortable
      connectWith: '[data-resource="tile"]'
      items: '> [data-resource="component"]'
      handle: '[data-toolbar="handle"]'
      start: (event, ui) ->
        ui.item.parent().removeClass('component-toolbar')
        ui.item.find('.handle').addClass('hide')
      beforeStop: (event, ui) =>
        @addComponent ui.item, $(event.target)

  addComponent: ($component, $container) ->
    $container.addClass('component-toolbar')
    $container.html $component.clone()
    $container.find('.handle').removeClass('hide')

    newId = new Date().getTime()
    $component.find('.handle').remove()
    $component.removeAttr('data-disabled')
    $component.removeData('disabled')
    $component.data('id', newId)
    $component.resource()

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
