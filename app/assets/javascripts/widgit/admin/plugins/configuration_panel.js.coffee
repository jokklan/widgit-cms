'use strict'
$ = jQuery

# CLASS DEFINITION
class ConfigurationPanel extends BasePlugin
  constructor: (el, options) ->
    @$panel = $(el)
    @$configuration_panels = $('[data-configuration]')
    @$element = null

    super(el, options)

  refresh: (options) ->

  init: ->
    super()

    $(document).on 'click', '[data-resource]:not([data-disabled])', (event)=>
      event.stopPropagation()
      @$element = $(event.currentTarget)
      type = @$element.resource('type')

      @$configuration_panels.addClass('hidden')
      @$configuration_panels.filter("[data-configuration=\"#{type}\"]").removeClass('hidden')



# DATA-API
BasePlugin.addPlugin
  name: 'configurationpanel'
  klass: ConfigurationPanel
  selector: '[data-init="configurationpanel"]'
