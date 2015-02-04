'use strict'
$ = jQuery

# CLASS DEFINITION
class Block extends Resource
  type: 'block'

  data: ->
    columns_attributes = @$resource.find('[data-resource="column"]').map(-> $(this).resource('data')).get()

    $.extend({}, @attributes, { columns_attributes: columns_attributes })

  updateDom: ->
    $.ajax
      url: "/admin/blocks/#{@id}",
      method: 'GET'
      data: { block: @data() }

Resource.addType('block', Block)
