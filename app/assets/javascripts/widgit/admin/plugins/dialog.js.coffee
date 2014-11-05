'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class Dialog extends BaseModule
  constructor: (el, options) ->
    @options = $.extend({}, @defaults, options)
    @$modal = $(el)
    @callback = ->
    @init()

  init: ->
    $(document).on 'click', '[data-dialog="link"]', (event)=>
      event.preventDefault()
      imageAttributes = $(event.currentTarget).data('attributes')
      @callback(imageAttributes)
      @close()


  setCallback: (callback) ->
    @callback = callback

  open: ->
    @$modal.modal('show')

  close: ->
    @$modal.modal('hide')

# PLUGIN DEFINITION
$.fn.extend dialog: (option, args...) ->
  @each ->
    $this = $(this)
    data = $this.data('widgit.dialog')

    if !data
      $this.data 'widgit.dialog', (data = new Dialog(this, option))
    if typeof option == 'string'
      data[option].apply(data, args)

# DATA-API
$(document).on 'page:update', ->
  $('[data-init="dialog"]').dialog()

