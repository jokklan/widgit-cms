'use strict'
$ = jQuery

# CLASS DEFINITION
class Block extends Resource
  data: ->
    component_attributes = @$resource.find('[data-resource="component"]').map(-> $(this).resource('data')).get()
    $.extend({}, @attributes, { components_attributes: component_attributes })

Resource.addType('block', Block)
