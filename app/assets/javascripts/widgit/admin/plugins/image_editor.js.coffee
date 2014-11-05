'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class ImageEditor extends BaseModule
  defaults: {
    imageTemplate: '<img alt="_ALT_" src="_SRC_">'
  }
  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)
    @$dialog = $('[data-init="dialog"]')
    @$parent = @$el.closest('[data-resource]')

    @init()

  init: () ->
    @$el.on 'click', =>
      @$dialog.dialog 'setCallback', (data)=>
        @update(data.name, data.id, data.url)

      @$dialog.dialog('open')

  update: (name, id, url)->
    html = @options.imageTemplate.replace('_ALT_', name).replace('_SRC_', url)

    @$el.html(html)
    @$parent.resource('update', 'image_id', id)

# PLUGIN DEFINITION
$.fn.extend imageeditor: (option, args...) ->
  @each ->
    $this = $(this)
    data = $this.data('widgit.imageeditor')

    if !data
      $this.data 'widgit.imageeditor', (data = new ImageEditor(this, option))
    if typeof option == 'string'
      data[option].apply(data, args)

# DATA-API
$(document).on 'page:update', ->
  $('[data-editor="image"]').imageeditor()

