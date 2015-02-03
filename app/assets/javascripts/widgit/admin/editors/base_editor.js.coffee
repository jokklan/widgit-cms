'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseEditor extends BasePlugin
  editorName: undefined
  dialog: false

  constructor: (el, options) ->
    super(el, options)
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
        attributeName = @$this.data('attr')
        data = {}
        data[attributeName] = value

        @update(data)

  attributeName: ->
    @editorName

  update: (data)->
    $element = @$panel.panel('getElement')

    @updateInput($data)

  updateInput: (data) ->
    @$this.val(data[@attributeName()])

  updateInputWithElement: ($element) ->
    attributeName = @$this.data('attr')
    value = $element.resource('data')[attributeName]
    data = {}

    if @dialog
      data = $.extend(data, @$dialog.dialog('getAttributes', @editorName, value))
    else
      data[attributeName] = value

    @updateInput data


BasePlugin.addPlugin
  name: 'editor'
  klass: BaseEditor
  selector: '[data-input="string"]'
