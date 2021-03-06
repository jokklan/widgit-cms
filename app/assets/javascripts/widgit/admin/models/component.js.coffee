'use strict'
$ = jQuery

# CLASS DEFINITION
class Component extends Resource
  constructor: (element, attributes = {}) ->
    super(element, attributes)
    @$tile = @$resource.closest('[data-resource="tile"]')
    @$block = @$resource.closest('[data-resource="block"]')

  update: (attribute, value) ->
    super(attribute, value)
    @$tile.resource('updateDom')

  type: ->
    @attributes.type.split('::').pop().toLowerCase()

Resource.addType('component', Component)
