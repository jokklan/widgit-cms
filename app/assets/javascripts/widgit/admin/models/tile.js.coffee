'use strict'
$ = jQuery

# CLASS DEFINITION
class Tile extends Resource
  data: ->
    components_attributes = @$resource.find('[data-resource="component"]').map(-> $(this).resource('data')).get()
    $.extend({}, @attributes, { components_attributes: components_attributes })

  save: ->
    $.ajax
      url: "/admin/tiles/#{@id}",
      method: 'PATCH',
      dataType: 'json',
      data: { tile: { saved: true } }


Resource.addType('tile', Tile)
