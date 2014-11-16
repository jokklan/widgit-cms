'use strict'
$ = jQuery

# CLASS DEFINITION
class Column extends Resource
  data: ->
    tile_attributess = @$resource.find('[data-resource="tile"]').resource('data')

    $.extend({}, @attributes, { tile_attributes: tile_attributess })

Resource.addType('column', Column)
