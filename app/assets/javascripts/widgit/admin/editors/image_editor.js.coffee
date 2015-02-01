'use strict'
$ = jQuery

Dropzone.autoDiscover = false

# CLASS DEFINITION
class ImageEditor extends BaseEditor
  editorName: 'image'

  updateDomElement: ($element, data)->
    $element.find('img').attr
      src: data.url
      alt: data.name

  attributeName: ->
    'id'

$(document).ready ->
  window.imageEditor = new ImageEditor()
