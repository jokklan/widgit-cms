'use strict'
$ = jQuery

# CLASS DEFINITION
class Toolbar extends BasePlugin
  constructor: (el, options) ->
    @$toolbar = $(el)
    @$currentObject = null

    super(el, options)

  init: ->
    $(document).on 'mouseenter', '[data-resource="tile"]', (event)=>
      @show(event.currentTarget)

    $(document).on 'click', '[data-toggle="add-component"]', (event)=>
      @addComponent(event.target)

    $(document).on 'click', '[data-toggle="remove"]', (event)=>
      @remove()

  show: (object)->
    @$currentObject = $(object)
    $block = @$currentObject.closest('[data-resource="block"]')
    @$toolbar.insertAfter($block)


  addComponent: (btn)->
    type = $(btn).data('type')

    $.ajax
      url: "/admin/components/new",
      method: 'GET',
      data: { component: { type: type }, target_id: @$currentObject.resource('id') }

  remove: ->
    @$currentObject.addClass('hide')
    @$currentObject.resource('update', '_destroy', true)


# DATA-API
BasePlugin.addPlugin
  name: 'toolbar'
  klass: Toolbar
  selector: '[data-init="toolbar"]'
