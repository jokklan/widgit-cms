'use strict'
$ = jQuery

# CLASS DEFINITION
class ColorEditor extends BasePlugin 
  
  constructor: (el, options) ->
    super(el, options)
    @$parent = @$this.closest('[data-resource]')

  init: ->
    @$this.append @makeModal()
    modalOpen = false
    holdDelay = 0
    $modal = ''

    $(document).on 'hidden.bs.modal', $modal, ->
      # waits for animations to finish
      setTimeout ->
        modalOpen = false
      , 100

    $(document).on 'mousedown', '[data-resource="block"]', (event) =>
      $target = $(event.currentTarget)

      holdDelay = setTimeout ->
        if !modalOpen and !$('.ui-sortable-helper').length
          $modal = $target.find('[data-color="modal"]')
          $modal.modal()
          modalOpen = true 
      , 1500   

    $(document).on 'mouseup', '[data-resource="block"]', ->
      clearTimeout(holdDelay)      

    @$this.find('[data-color-item]').on 'click', (event) =>  
      $target = $(event.currentTarget) 
      $block  = $target.closest '[data-resource="block"]'

      attributes       = $block.data 'attributes'
      previousColor    = attributes.color     
      @newColor        = $target.data('color-item')
      attributes.color = @newColor

      $block
        .removeClass 'color-' + previousColor
        .addClass 'color-' + @newColor  

      $modal.modal('hide')

      @update()  

  update: ->
    $(document).trigger 'page:update'
    @$parent.resource('update', 'color', @newColor)    

  makeModal: ->
    modal = "
              <div class='modal fade text-left' data-color='modal'>
                <div class='modal-dialog'>
                  <div class='modal-content'>
                    <div class='modal-body'>
                      #{@makeColorList()}
                    </div>
                  </div>
                </div>
              </div>
            "    

  makeColorList: ->
    colors = ["white", "blue", "green", "yellow", "red"]
    colorHtml = ''

    for index, color of colors
      colorHtml += "<div class='color-list-item color-#{color}' data-color-item='#{color}'></div>"

    colorHtml

# DATA-API
BasePlugin.addPlugin
  name: 'coloreditor'
  klass: ColorEditor
  selector: '[data-editor="color"]'
