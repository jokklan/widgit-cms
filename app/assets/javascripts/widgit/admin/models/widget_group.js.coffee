'use strict'
$ = jQuery

# CLASS DEFINITION
class WidgetGroup extends Resource
  data: ->
    widget_attributes = @$resource.find('[data-resource="widget"]').map(-> $(this).resource('data')).get()
    $.extend({}, @attributes, { widgets_attributes: widget_attributes })

Resource.addType('widget-group', WidgetGroup)
