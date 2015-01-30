'use strict'
$ = jQuery

Dropzone.autoDiscover = false;

# CLASS DEFINITION
class Dialog extends BasePlugin
  currentPanel: null
  constructor: (el, options) ->
    @$modal = $(el)
    @$panels = @$modal.find('[data-dialog-panel]')
    @callback = ->

    super(el, options)

  init: ->
    $(document).on 'click', '[data-dialog="link"]', (event)=>
      event.preventDefault()
      attributes = $(event.currentTarget).data('attributes')
      @callback(attributes)
      @close()


  setCallback: (callback) ->
    @callback = callback

  getCurrentPanel: ->
    @$panels.filter("[data-dialog-panel=#{@currentPanel}]")

  open: (panel)->
    @currentPanel = panel
    @$modal.modal('show')
    @getCurrentPanel().removeClass('hidden')

  close: ->
    @$modal.modal('hide')
    @getCurrentPanel().addClass('hidden')

# DATA-API
BasePlugin.addPlugin
  name: 'dialog'
  klass: Dialog
  selector: '[data-init="dialog"]'
