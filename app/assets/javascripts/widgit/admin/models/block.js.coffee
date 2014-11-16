'use strict'
$ = jQuery

# CLASS DEFINITION
class Block extends Resource
  data: ->
    columns_attributes = @$resource.find('[data-resource="column"]').map(-> $(this).resource('data')).get()

    $.extend({}, @attributes, { columns_attributes: columns_attributes })

Resource.addType('block', Block)
