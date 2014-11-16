'use strict'
$ = jQuery

# CLASS DEFINITION
class ComponentEditor extends BasePlugin
  constructor: (element, options) ->
    @$container = $('[data-container="new-component"]')
    @timeout = undefined
    @active = false

    super(element, options)

  init: ->
    @$this.on 'mouseenter', (event)=>
      clearTimeout @timeout
      @active = true
      @show(event.currentTarget)

    @$this.on 'mouseleave', =>
      @timeout = setTimeout =>
        @active = false
        @hide()
      , 1000

    $(document).on 'click', '[data-toggle="add-component"]', (event)=>
      if @active
        @addComponent(event.target)

  show: (tile)->
    offset = @$this.offset()

    @$container.css
      left: offset.left
      top: offset.top + @$this.height()

    @$container.removeClass('hide')

  hide: ->
    @$container.addClass('hide')

  addComponent: (btn)->
    type = $(btn).data('type')

    $.ajax
      url: "/admin/components/new",
      method: 'GET',
      data: { component: { type: type }, target_id: @$this.resource('id') }


# DATA-API
BasePlugin.addPlugin
  name: 'componenteditor'
  klass: ComponentEditor
  selector: '[data-editor="components"]'
