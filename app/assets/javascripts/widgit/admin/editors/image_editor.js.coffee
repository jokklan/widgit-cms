'use strict'
$ = jQuery

Dropzone.autoDiscover = false

# CLASS DEFINITION
class ImageEditor extends BaseEditor
  editorName: 'image'
  dialog: true

  updateInput: (data) ->
    console.log("HEJ")
    super(data)
    @$input.parent().find('img').attr
      src: data.url

  attributeName: ->
    'id'

$(document).on 'page:change', ->
  $('[data-input="image"]').editor(ImageEditor)
