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
    $(document).on 'click', "[data-editor=#{@editorName}]", =>
      @$dialog.dialog 'setCallback', (data)=>
        @update(data)

      @$dialog.dialog('open', @editorName)

  attributeName: ->
    @editorName

  update: (data)->
    $element = @$panel.panel('getElement')

    @updateDomElement($element, data)
    @updateResource($element, data)

  updateDomElement: ($element, data) ->

  updateResource: ($element, data) ->
    $element.resource('update', @attributeName(), data[@attributeName()])
