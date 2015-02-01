'use strict'
$ = jQuery

Dropzone.autoDiscover = false

# CLASS DEFINITION
class ImageEditor extends BaseEditor
  editorName: 'image'
  dialog: true

  updateDomElement: ($element, data)->
    $element.find('img').attr
      src: data.url
      alt: data.name

  updateInput: ($input, data) ->
    $input.parent().find('img').attr
      src: data.url
      class: 'img-responsive gt-bottom'
      "data-input": 'image'

    $input.parent().find('input').attr
      class: 'hidden'


  attributeName: ->
    'id'

$(document).ready ->
  window.imageEditor = new ImageEditor()
