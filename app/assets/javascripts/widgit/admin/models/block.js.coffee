'use strict'
$ = jQuery

# CLASS DEFINITION
class Block extends Resource
  data: ->
    tiles_attributes = @$resource.find('[data-resource="tile"]').map(-> $(this).resource('data')).get()
    columns_attributes = @$resource.find('[data-resource="column"]').map(-> $(this).resource('data')).get()

    $.extend({}, @attributes, { tiles_attributes: tiles_attributes, columns_attributes: columns_attributes })

Resource.addType('block', Block)
