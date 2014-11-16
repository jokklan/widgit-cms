'use strict'
$ = jQuery

# CLASS DEFINITION
class Tile extends Resource
  addComponent: (type)->
    $.ajax
      url: "/admin/tiles/#{@id}/components/new",
      method: 'GET',
      data: { component: { type: type } }

  data: ->
    components_attributes = @$resource.find('[data-resource="component"]').map(-> $(this).resource('data')).get()
    $.extend({}, @attributes, { components_attributes: components_attributes })

Resource.addType('tile', Tile)
