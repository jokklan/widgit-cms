'use strict'
$ = jQuery

# CLASS DEFINITION
class Component extends Resource
  update: (attribute, value) ->
    super(attribute, value)
    @updateDom()

  updateDom: ->
    components = $('[data-resource="component"][data-id="' + @id + '"]').not(@$resource)

    if components.length > 0
      components.html @$resource.html()
      $(document).trigger('page:update')

Resource.addType('component', Component)
