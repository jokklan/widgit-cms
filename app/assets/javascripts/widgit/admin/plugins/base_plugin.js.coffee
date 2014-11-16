'use strict'
$ = jQuery

# CLASS DEFINITION
class @BasePlugin extends BaseModule
  @widgitPlugins: []

  @addPlugin: (plugin)->
    @widgitPlugins.push plugin

  constructor: (element, options) ->
    @options = $.extend({}, @defaults, options)
    @$this = $(element)

    @init()

initializePlugin = (plugin) ->
  name = plugin.name
  dataNamespace = "widgit.#{name}"

  $.fn[name] = (option, args...) ->
    @each ->
      $this = $(this)
      data = $this.data(dataNamespace)

      if !data
        $this.data dataNamespace, (data = new plugin.klass(this, option))

      if typeof option == 'string'
        data[option].apply(data, args)

$(document).on 'page:change', ->
  $.each BasePlugin.widgitPlugins, ->
    initializePlugin(this)
    $(this.selector)[this.name]()
