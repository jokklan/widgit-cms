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

  getCurrentPanel: ->
    @activePanels[@activePanels.length-1] || { panel: $(), element: $() }

  resetPanels: ->
    @activePanels = []

  addPanel: (type, $element)->
    @activePanels.unshift
      panel: @$panels.filter("[data-panel=\"#{type}\"]")
      element: $element

  activateCurrentPanel: ->
    @getCurrentPanel().panel.removeClass 'hidden'

  activatePanel: (type, $element)->
    $element ||= @getCurrentPanel().element
    @getCurrentPanel().panel.addClass 'hidden'
    @activePanels.push
      panel: @$panels.filter("[data-panel=\"#{type}\"]")
      element: $element

    @activateCurrentPanel()

    return $element

  back: ->
    @getCurrentPanel().panel.addClass 'hidden'
    @activePanels.pop()
    @getCurrentPanel().panel.removeClass 'hidden'

# DATA-API
BasePlugin.addPlugin
  name: 'panel'
  klass: ConfigurationPanel
  selector: '[data-init="panel"]'
