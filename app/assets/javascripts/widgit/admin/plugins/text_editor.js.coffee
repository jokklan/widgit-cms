'use strict'
$ = jQuery

# CLASS DEFINITION
class TextEditor

  defaults:
    event: 'hallodeactivated'

  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)
    @id = @$el.data('id')

    @init()

  init: (echo) ->
    @$el.on @options.event, (event) =>
      @update()

  update: ->
    value = $.trim @$el.html()
    window.pageForm.addWidget(@id, 'text', value)

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
$(document).on 'page:change', ->
  $('[data-editor="text"]').texteditor()
