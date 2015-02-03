'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BaseEditor
  editorName: 'color'
  dialog: true

BasePlugin.addPlugin
  name: 'editor'
  klass: ColorEditor
  selector: '[data-input="color"]'
