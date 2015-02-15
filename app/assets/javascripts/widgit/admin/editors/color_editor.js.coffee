'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BaseEditor
  editorName: 'color'
  itemList: true

  itemEditor: ->
    @colorEditor = $('[data-editor=color]')
    @colorEditor.append @makeColorList()

    $(document).on 'click', '[data-color-item]', (event) =>
      @applyToInput $(event.currentTarget)

  makeColorList: ->
    colors = ["white", "light-gray", "black", "blue", "green", "yellow", "red", "orange"]
    colorHtml = ''

    for index, color of colors
      colorHtml += "<div title='#{color}' class='color-list-item background-color-#{color}' data-color-item='#{color}'></div>"

    colorHtml  

  applyToInput: ($target) ->
    value = $target.data('color-item')
    $target
      .siblings('input')
      .val(value)
      .attr('value', value)
      .trigger('change')   

$(document).ready ->
  window.colorEditor = new ColorEditor()
