'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BasePlugin

  constructor: (el, options) ->
    super(el, options)
    @$panel = $('[data-init="panel"]')
    @$element = null

  init: ->
    $(document).on 'click', '[data-editor="color"]', =>
      @$element = @$panel.panel('activatePanel', 'color-picker')

    $(document).on 'click', '[data-color-item]', (event) =>
      $target = $(event.currentTarget)

      attributes       = @$element.data 'attributes'
      previousColor    = attributes.color
      @newColor        = $target.data('color-item')
      attributes.color = @newColor

      @$element
        .removeClass 'color-' + previousColor
        .addClass 'color-' + @newColor

      @$element.resource('update', 'color', @newColor)

# DATA-API
BasePlugin.addPlugin
  name: 'coloreditor'
  klass: ColorEditor
  selector: '[data-editor="color"]'
