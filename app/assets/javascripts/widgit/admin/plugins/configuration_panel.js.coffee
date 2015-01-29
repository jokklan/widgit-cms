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

    $(document).on 'click', '[data-resource]:not([data-disabled])', (event)=>
      event.stopPropagation()
      $resource = $(event.currentTarget)

      @resetPanels()

      while $resource.length > 0
        type = $resource.resource('type')
        @addPanel(type, $resource)
        $resource = $resource.parent().closest('[data-resource]')

      @activateCurrentPanel()

    $(document).on 'click', '[data-panel="back"]', (event)=>
      @back()

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
    @getPanelObject().removeClass 'hidden'

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

# DATA-API
BasePlugin.addPlugin
  name: 'panel'
  klass: ConfigurationPanel
  selector: '[data-init="panel"]'
