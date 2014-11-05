'use strict'
$ = jQuery

# CLASS DEFINITION
class TextEditor extends BasePlugin
  defaults:
    event: 'hallodeactivated'

  constructor: (el, options) ->
    super(el, options)
    @$parent = @$this.closest('[data-resource]')

  init: (echo) ->
    @$this.hallo()
    @$this.on @options.event, (event) =>
      @update()

  update: ->
    value = $.trim @$this.html()
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

# DATA-API
BasePlugin.addPlugin
  name: 'texteditor'
  klass: TextEditor
  selector: '[data-editor="text"]'
