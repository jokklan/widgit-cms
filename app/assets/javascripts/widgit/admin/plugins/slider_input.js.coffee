'use strict'
$ = jQuery

# CLASS DEFINITION
class SliderInput extends BasePlugin
  constructor: (el, options) ->
    super(el, options)

  init: () ->
    $input = $('[data-input="slider"]').find('input')
    $slider = $('[data-slider="target"]')
    
    $('[data-slider="target"]').noUiSlider
      start: [2]
      step: 1
      range:
        'min': 1
        'max': 3

    $slider.on 'change', ->
      $input
        .val Math.round $(this).val()
        .trigger 'change'

    $(document).on "activate:panel", ->
      unless $input.closest('[data-panel]').hasClass "hidden"
        $slider.val($input.val() || 2)

# DATA-API
BasePlugin.addPlugin
  name: 'uploadeditor'
  klass: SliderInput
  selector: '[data-input="slider"]'
