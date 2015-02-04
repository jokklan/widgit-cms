'use strict'
$ = jQuery

# CLASS DEFINITION
class Tile extends Resource
  type: 'tile'

  constructor: (element, attributes = {}) ->
    super(element, attributes)
    @$block = @$resource.closest('[data-resource="block"]')

  data: ->
    components_attributes = @$resource.find('[data-resource="component"]').map(-> $(this).resource('data')).get()
    $.extend({}, @attributes, { components_attributes: components_attributes })

  updateDom: ->
    tiles = $('[data-resource="tile"][data-id="' + @id + '"]').not(@$resource)

    if tiles.length > 0
      tiles.html @$resource.html()
      $(document).trigger('page:update')

  save: ->
    $.ajax
      url: "/admin/tiles/#{@id}",
      method: 'PATCH',
      dataType: 'json',
      data: { tile: { saved: true } }


Resource.addType('tile', Tile)
