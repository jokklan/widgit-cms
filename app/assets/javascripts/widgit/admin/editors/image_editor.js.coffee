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
    super($input, data)
    $input.parent().find('img').attr
      src: data.url

  attributeName: ->
    'id'

$(document).ready ->
  window.imageEditor = new ImageEditor()
