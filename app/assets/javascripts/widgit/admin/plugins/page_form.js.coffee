class PageForm
  data: {}

  constructor: (options) ->
    @options = $.extend({}, options)
    @id = $('body').data('id')

  submit: ->
    $.ajax
      url: "/admin/pages/#{@id}",
      method: 'PATCH',
      dataType: 'json',
      data: { page: @data }
    @data = {}

  add: (type, id, attribute, value) ->
    @data[type] ||= {}
    @data[type][id] ||= {}
    @data[type][id]['id'] = id
    @data[type][id][attribute] = value

  addWidget: (id, attribute, value) ->
    @add 'widgets_attributes', id, attribute, value

  addWidgetGroup: (id, attribute, value) ->
    @add 'widget_groups_attributes', id, attribute, value


# DATA-API
$(document).on 'page:change', ->
  window.pageForm = new PageForm()
