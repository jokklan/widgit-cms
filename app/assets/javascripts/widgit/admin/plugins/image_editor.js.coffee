'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class ImageEditor extends BasePlugin
  defaults: {
    imageTemplate: '<img alt="_ALT_" src="_SRC_">'
  }

  constructor: (el, options) ->
    @$dialog = $('[data-init="dialog"]')
    @$parent = $(el).closest('[data-resource]')

    super(el, options)

  init: () ->
    @$this.on 'click', =>
      @$dialog.dialog 'setCallback', (data)=>
        @update(data.name, data.id, data.url)

      @$dialog.dialog('open')

  update: (name, id, url)->
    html = @options.imageTemplate.replace('_ALT_', name).replace('_SRC_', url)

    @$this.html(html)
    @$parent.resource('update', 'image_id', id)

# DATA-API
BasePlugin.addPlugin
  name: 'imageeditor'
  klass: ImageEditor
  selector: '[data-editor="image"]'
