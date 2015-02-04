'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseEditor extends BaseModule
  editorName: undefined
  dialog: false

  constructor: (el, options) ->
    super(options)
    @$input = $(el)
    @$dialog = $('[data-init="dialog"]')
    @$panel = $('[data-init="panel"]')

  init: ->
    if @dialog
      $(document).on 'click', "[data-input=#{@editorName}]", (event)=>
        @$dialog.dialog 'setCallback', (data)=>
          @update(data)

        @$dialog.dialog('open', @editorName)
    else
      $(document).on 'change', "[data-input=#{@editorName}]", (event)=>
        attributeName = @$input.data('attr')
        data = {}
        data[attributeName] = value

        @update(data)

  attributeName: ->
    @editorName

  update: (data)->
    $element = @$panel.panel('getElement')

    @updateInput(data)
    @$input.change()

  updateInput: (data) ->
    @$input.val(data[@attributeName()])

  updateInputWithElement: ($element) ->
    attributeName = @$input.data('attr')
    value = $element.resource('data')[attributeName]
    data = {}

    if @dialog
      data = $.extend(data, @$dialog.dialog('getAttributes', @editorName, value))
    else
      data[attributeName] = value

    @updateInput data

$.fn.editor = (methodOrClass, args...) ->
  @each ->
    $this = $(this)
    data = $this.data('widgit.editor')

    if data
      data[methodOrClass].apply(data, args)
    else
      $this.data 'widgit.editor', (data = new methodOrClass(this, args))
