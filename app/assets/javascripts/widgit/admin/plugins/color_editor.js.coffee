'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BasePlugin

  constructor: (el, options) ->
    super(el, options)
    @$dialog = $('[data-init="dialog"]')
    @$panel = $('[data-init="panel"]')

  init: ->
    $(document).on 'click', '[data-editor="color"]', =>
      @$dialog.dialog 'setCallback', (data)=>
        @update(data.color)

      @$dialog.dialog('open', 'color')

  update: (color)->
    $element = @$panel.panel('getElement')

    $element
      .removeClassPrefix 'color-'
      .addClass "color-#{color}"

    $element.resource('update', 'color', color)


# DATA-API
BasePlugin.addPlugin
  name: 'coloreditor'
  klass: ColorEditor
  selector: '[data-editor="color"]'
