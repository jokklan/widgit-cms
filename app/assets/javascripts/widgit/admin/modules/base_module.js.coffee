'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseModule
  constructor: (options) ->
    @options = $.extend({}, @defaults, options)

    @init()

  refresh: ->

  init: ->
    @refresh()
    $(document).on 'page:change', =>
      @refresh()

