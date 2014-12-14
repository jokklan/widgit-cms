'use strict'
$ = jQuery

# CLASS DEFINITION
class @Resource
  @resouceTypes: {}

  @addType: (type, klass)->
    @resouceTypes[type] = klass

  constructor: (element, attributes = {}) ->
    @$resource = $(element)
    @attributes = $.extend({}, attributes, @$resource.data('attributes'))
    @id = @$resource.data('id')

  update: (attribute, value) ->
    @attributes[attribute] = value

  data: ->
    @attributes

# PLUGIN DEFINITION
$.fn.resource = (option, args...) ->
  if typeof option == "string"
    $this = $(this)
    data = $this.data('widgit.resource')
    method = data[option]

    if typeof method == 'function'
      data[option].apply(data, args)
    else
      data[option]
  else
    @each ->
      $this = $(this)
      data = $this.data('widgit.resource')

      if !data
        type = $this.data('resource')
        klass = if type then Resource.resouceTypes[type] else Resource

        $this.data 'widgit.resource', (data = new klass(this, option))

# DATA-API
$(document).on 'page:update', ->
  $('[data-resource]:not([data-disabled])').resource()
