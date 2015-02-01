'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseEditor extends BaseModule
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
          @update($(event.currentTarget), data)

        @$dialog.dialog('open', @editorName)
    else
      $(document).on 'change', "[data-input=#{@editorName}]", (event)=>
        $input = $(event.currentTarget)
        attributeName = $input.data('attr')
        value = $input.val()
        data = {}
        data[attributeName] = value

        @update($input, data)

  attributeName: ->
    @editorName

  update: ($input, data)->
    $element = @$panel.panel('getElement')

    @updateDomElement($element, data)
    @updateInput($input, data)

  updateInput: ($input, data) ->
    $input.val(data[@attributeName()])
    if @dialog
      $input.change()

  updateDomElement: ($element, data) ->
