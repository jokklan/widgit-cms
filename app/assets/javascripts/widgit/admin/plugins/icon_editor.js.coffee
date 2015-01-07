'use strict'
$ = jQuery

# CLASS DEFINITION
class IconEditor extends BasePlugin 
  
  constructor: (el, options) ->
    super(el, options)
    @$parent = @$this.closest('[data-resource]')

  init: ->

    @$this.append @makeModal()

    @$this.find('[data-toggle="icon"]').on 'click', (event) =>
      $(event.currentTarget).siblings('[data-icon="modal"]').modal()

    @$this.find('[data-icon-item]').on 'click', (event) =>  
      $target = $(event.currentTarget)
      $parent = $target.closest('[data-editor="icon"]')
      $icon = $parent.find('[data-toggle="icon"]')
      @icon = $target.data 'icon-item'

      $icon.removeClass().addClass('fa fa-' + @icon)

      $parent.find('[data-icon="modal"]').modal('hide')
      @update()  

  update: ->
    console.log @icon
    @$parent.resource('update', 'icon', @icon)    

  makeModal: ->
    modal = "
              <div class='modal fade text-left' data-icon='modal'>
                <div class='modal-dialog'>
                  <div class='modal-content'>
                    <div class='modal-body'>
                      #{@makeIconList()}
                    </div>
                  </div>
                </div>
              </div>
            "    

  makeIconList: ->
    icons = ["camera", "cutlery", "phone", "rocket"]

    iconHtml = ''

    for index, icon of icons
      iconHtml += "<div class='icon-list-item fa fa-#{icon}' data-icon-item='#{icon}'></div>"

    iconHtml

# DATA-API
BasePlugin.addPlugin
  name: 'iconeditor'
  klass: IconEditor
  selector: '[data-editor="icon"]'

