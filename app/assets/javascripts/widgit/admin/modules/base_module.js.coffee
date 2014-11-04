'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseModule
  defaults: {}
  constructor: (options) ->
    @options = $.extend({}, @defaults, options)

    @init()

  refresh: ->

  init: ->
    @refresh()
    $(document).on 'page:update', =>
      @refresh()

