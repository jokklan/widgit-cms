'use strict'
$ = jQuery

# CLASS DEFINITION
class SliderInput extends BasePlugin
  constructor: (el, options) ->
    super(el, options)

  init: () ->
    $input = $('[data-input="slider"]').find('input')
    $slider = $('[data-slider="target"]')

    sizes = ["small", "medium", "large"]  

    $('[data-slider="target"]').noUiSlider
      start: [1]
      step: 1
      range:
        'min': 0
        'max': sizes.length - 1 

    $slider.on 'change', ->
      val = Math.round($(this).val())

      for size, i in sizes
        if val == i
          $input
            .val(size)
            .trigger 'change'    

# DATA-API
BasePlugin.addPlugin
  name: 'uploadeditor'
  klass: SliderInput
  selector: '[data-input="slider"]'
