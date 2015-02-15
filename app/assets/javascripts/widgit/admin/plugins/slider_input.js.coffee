'use strict'
$ = jQuery

# CLASS DEFINITION
class SliderInput extends BasePlugin
  constructor: (el, options) ->
    super(el, options)

  init: () ->
    $input = @$this.closest('[data-input="slider"]').find('input')

    @$this.noUiSlider
      start: [2]
      step: 1
      direction: "rtl"
      range:
        'min': 1
        'max': 3

    @$this.on 'change', ->
      $input
        .val Math.round $(this).val()
        .trigger 'change'

    $(document).on "activate:panel", =>
      unless $input.closest('[data-panel]').hasClass "hidden"
        @$this.val($input.val())

# DATA-API
BasePlugin.addPlugin
  name: 'sliderinput'
  klass: SliderInput
  selector: '[data-slider="target"]'
