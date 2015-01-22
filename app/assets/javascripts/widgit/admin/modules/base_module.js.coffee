'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseModule
  defaults: {}
  initialized: false
  constructor: (options) ->
    @options = $.extend({}, @defaults, options)

    @init()

  refresh: ->

  init: ->
    @refresh()
    $(document).on 'page:update', =>
      @refresh()

    @initialized = true

