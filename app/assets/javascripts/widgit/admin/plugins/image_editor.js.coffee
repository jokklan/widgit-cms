'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class ImageEditor extends BasePlugin
  defaults: {
    imageTemplate: '<img class="img-responsive" alt="_ALT_" src="_SRC_">'
  }

  constructor: (el, options) ->
    @$dialog = $('[data-init="dialog"]')
    @$panel  = $('[data-init="panel"]')

    super(el, options)

  init: () ->
    @$this.on 'click', =>
      @$dialog.dialog 'setCallback', (data)=>
        @update(data.name, data.id, data.url)

      @$dialog.dialog('open')


  update: (name, id, url)->
    $element = @$panel.panel('getElement')
    html = @options.imageTemplate.replace('_ALT_', name).replace('_SRC_', url)

    @$this.find('img').add($element.find('img')).attr
      src: url
      alt: name

    $element.resource('update', 'image_id', id)

# DATA-API
BasePlugin.addPlugin
  name: 'imageeditor'
  klass: ImageEditor
  selector: '[data-editor="image"]'
