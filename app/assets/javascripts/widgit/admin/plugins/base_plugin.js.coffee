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
    if typeof option == 'string'
      $this = $(this)
      data = $this.data(dataNamespace)

      data[option].apply(data, args)
    else
      @each ->
        $this = $(this)
        data = $this.data(dataNamespace)

        if !data
          $this.data dataNamespace, (data = new plugin.klass(this, option))



$(document).on 'page:update', ->
  $.each BasePlugin.widgitPlugins, ->
    initializePlugin(this)
    $(this.selector)[this.name]()
