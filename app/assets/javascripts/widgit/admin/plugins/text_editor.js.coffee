'use strict'
$ = jQuery

# CLASS DEFINITION
class TextEditor extends BaseModule
  defaults:
    event: 'hallodeactivated'

  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)
    @$parent = @$el.closest('[data-resource]')

    @init()

  init: (echo) ->
    @$el.hallo()
    @$el.on @options.event, (event) =>
      @update()

  update: ->
    value = $.trim @$el.html()
    @$parent.resource('update', 'text', value)

# PLUGIN DEFINITION
$.fn.extend texteditor: (option, args...) ->
  @each ->
    $this = $(this)
    data = $this.data('texteditor')

    if !data
      $this.data 'texteditor', (data = new TextEditor(this, option))
    if typeof option == 'string'
      data[option].apply(data, args)

# DATA-API
$(document).on 'page:update', ->
  $('[data-editor="text"]').texteditor()
