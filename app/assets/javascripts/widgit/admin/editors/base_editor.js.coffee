'use strict'
$ = jQuery

# CLASS DEFINITION
class @BaseEditor extends BaseModule
  editorName: undefined

  constructor: (el, options) ->
    super(el, options)
    @$dialog = $('[data-init="dialog"]')
    @$panel = $('[data-init="panel"]')

  init: ->
    $(document).on 'click', "[data-input=#{@editorName}]", (event)=>
      @$dialog.dialog 'setCallback', (data)=>

        @update($(event.currentTarget), data)

      @$dialog.dialog('open', @editorName)

  attributeName: ->
    @editorName

  update: ($input, data)->
    $element = @$panel.panel('getElement')

    @updateDomElement($element, data)
    @updateInput($input, data)

  updateInput: ($input, data) ->
    $input.val(data[@attributeName()])
    $input.change()

  updateDomElement: ($element, data) ->
