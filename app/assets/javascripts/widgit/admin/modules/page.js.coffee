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
      widget_groups_attributes: $('[data-resource="widget-group"]').map(-> $(this).resource('data')).get()
    }

$(document).ready ->
  window.page = new Page()

