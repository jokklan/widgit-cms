'use strict'
$ = jQuery

# CLASS DEFINITION
class IconEditor extends BaseEditor
  editorName: 'icon'
  dialog: true

  updateDomElement: ($element, data)->
    $element.find('.fa')
      .removeClassPrefix 'fa-'
      .addClass "fa-#{data.icon}"

$(document).ready ->
  window.iconEditor = new IconEditor()
