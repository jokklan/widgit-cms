'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class UploadEditor extends BasePlugin
  constructor: (el, options) ->
    @$dialog = $('[data-init="dialog"]')
    super(el, options)

  init: () ->
    @$this.dropzone
      url: '/admin/images'
      paramName: 'image[image]'
      sending: (file, xhr, formData, kage) ->
        $.rails.CSRFProtection(xhr)

# DATA-API
BasePlugin.addPlugin
  name: 'uploadeditor'
  klass: UploadEditor
  selector: '[data-editor="upload"]'
