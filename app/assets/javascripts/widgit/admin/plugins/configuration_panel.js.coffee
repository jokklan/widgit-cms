'use strict'
$ = jQuery

# CLASS DEFINITION
class ConfigurationPanel extends BasePlugin
  constructor: (el, options) ->
    @$sidePanel = $(el)
    @$panels = $('[data-panel]')
    @activePanels = []

    super(el, options)

  refresh: (options) ->

  init: ->
    super()

    $(document).on 'change', '[data-input]', (event) =>
      $input = $(event.currentTarget)
      $element = @getElement()
      attributeName = $input.data('attr')
      value = $input.val()

      $element.resource('update', attributeName, value)

    $(document).on 'click', '[data-resource]:not([data-disabled])', (event)=>
      event.stopPropagation()
      $resource = $(event.currentTarget)

      @resetPanels()

      while $resource.length > 0
        type = $resource.resource('type')
        @addPanel(type, $resource)
        $resource = $resource.parent().closest('[data-resource]')

      @activateCurrentPanel()

    $(document).on 'click', '[data-config="back"]', (event)=>
      @back()

    $(document).on 'click', '[data-config="delete"]', (event)=>
      @delete()

  getElement: ->
    @getCurrentPanel().element

  getPanelObject: ->
    @getCurrentPanel().panel

  getCurrentPanel: ->
    @activePanels[@activePanels.length-1] || { panel: $(), element: $() }

  resetPanels: ->
    @$panels.addClass('hidden')
    @activePanels = []

  addPanel: (type, $element)->
    @activePanels.unshift
      panel: @$panels.filter("[data-panel=\"#{type}\"]")
      element: $element

  activateCurrentPanel: ->
    $panel = @getPanelObject()
    attributes = @getElement().resource('data')
    $inputs = $panel.find('[data-input]')

    $inputs.each (index, input) =>
      $input = $(input)
      attributeName = $input.data('attr')
      value = attributes[attributeName]
      $input.val(value)

    $panel.removeClass 'hidden'
    $(document).trigger "activate:panel"

  activatePanel: (type, $element)->
    $element ||= @getElement()
    @getPanelObject().addClass 'hidden'
    @activePanels.push
      panel: @$panels.filter("[data-panel=\"#{type}\"]")
      element: $element

    @activateCurrentPanel()

    return $element

  back: ->
    @getPanelObject().addClass 'hidden'
    @activePanels.pop()
    @getPanelObject().removeClass 'hidden'

  delete: ->
    $element = @getElement()
    $element.addClass('hidden')
    $element.resource('update', '_destroy', true)

# DATA-API
BasePlugin.addPlugin
  name: 'panel'
  klass: ConfigurationPanel
  selector: '[data-init="panel"]'
