'use strict'
$ = jQuery

# CLASS DEFINITION
class IconEditor extends BasePlugin

  constructor: (el, options) ->
    super(el, options)
    @$dialog = $('[data-init="dialog"]')
    @$panel = $('[data-init="panel"]')

  init: ->
    $(document).on 'click', '[data-editor="icon"]', =>
      @$dialog.dialog 'setCallback', (data)=>
        @update(data.icon)

      @$dialog.dialog('open', 'icon')

  update: (icon)->
    $element = @$panel.panel('getElement')

    $element.find('.fa')
      .removeClassPrefix 'fa-'
      .addClass "fa-#{icon}"

    $element.resource('update', 'icon', icon)


# DATA-API
BasePlugin.addPlugin
  name: 'iconeditor'
  klass: IconEditor
  selector: '[data-editor="icon"]'

