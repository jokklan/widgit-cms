'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class UploadEditor extends BaseModule
  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)
    @$dialog = $('[data-init="dialog"]')

    @init()

  init: () ->
    @$el.dropzone
      url: '/admin/images'
      paramName: 'image[image]'
      sending: (file, xhr, formData, kage) ->
        $.rails.CSRFProtection(xhr)

# PLUGIN DEFINITION
$.fn.extend uploadeditor: (option, args...) ->
  @each ->
    $this = $(this)
    data = $this.data('widgit.uploadeditor')

    if !data
      $this.data 'widgit.uploadeditor', (data = new UploadEditor(this, option))
    if typeof option == 'string'
      data[option].apply(data, args)

# DATA-API
$(document).on 'page:update', ->
  $('[data-editor="upload"]').uploadeditor()

