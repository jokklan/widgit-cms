'use strict'
$ = jQuery

# CLASS DEFINITION
class Tile extends Resource
  data: ->
    components_attributes = @$resource.find('[data-resource="component"]').map(-> $(this).resource('data')).get()
    $.extend({}, @attributes, { components_attributes: components_attributes })

Resource.addType('tile', Tile)
