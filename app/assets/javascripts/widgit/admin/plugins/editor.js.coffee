'use strict'
$ = jQuery

# CLASS DEFINITION
Editor = {
  dataStore: []
  save: ->
    $.ajax(
      url: '/admin/pages/1',
      method: 'PATCH',
      dataType: 'json',
      data: { page: { widgets_attributes: @dataStore } }
    ).done ->
      alert("DONE")
  store: (data)->
    @dataStore.push(data)
}

# DATA-API
window.Editor = Editor
$(document).on 'click', '[data-toggle="save"]', ->
  Editor.save()
