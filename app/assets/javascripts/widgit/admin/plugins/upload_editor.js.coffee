'use strict'
$ = jQuery

# CLASS DEFINITION
class UploadEditor extends BaseModule
  defaults:
    event: 'hallodeactivated'

  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$el = $(el)
    @$parent = @$el.closest('[data-resource]')

    @init()

  init: (echo) ->
    @$el.dropzone
      url: '/admin/images'
      paramName: 'image[image]'
      success: (file, response, xhr) =>
        @update(response.id)

  update: (image_id)->
    @$parent.resource('update', 'image_id', image_id)

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
  $('[data-editor="image"]').uploadeditor()

