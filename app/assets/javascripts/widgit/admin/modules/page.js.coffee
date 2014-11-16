'use strict'
$ = jQuery

# CLASS DEFINITION
class Page extends BaseModule
  refresh: ->
    @id = $('body').data('id')

  save: ->
    $.ajax
      url: "/admin/pages/#{@id}",
      method: 'PATCH',
      dataType: 'json',
      data: { page: @data() }

  data: ->
    {
      blocks_attributes: $('[data-resource="block"]').map(-> $(this).resource('data')).get()
    }

$(document).ready ->
  window.page = new Page()

