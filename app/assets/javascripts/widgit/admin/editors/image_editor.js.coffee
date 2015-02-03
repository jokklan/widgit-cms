'use strict'
$ = jQuery

Dropzone.autoDiscover = false

# CLASS DEFINITION
class ImageEditor extends BaseEditor
  editorName: 'image'
  dialog: true

  updateInput: (data) ->
    super(data)
    @$this.parent().find('img').attr

  attributeName: ->
    'id'

BasePlugin.addPlugin
  name: 'editor'
  klass: ImageEditor
  selector: '[data-input="image"]'
