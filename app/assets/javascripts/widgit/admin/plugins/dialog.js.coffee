'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class Dialog extends BasePlugin
  constructor: (el, options) ->
    @$modal = $(el)
    @callback = ->

    super(el, options)

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

# DATA-API
BasePlugin.addPlugin
  name: 'dialog'
  klass: Dialog
  selector: '[data-init="dialog"]'
