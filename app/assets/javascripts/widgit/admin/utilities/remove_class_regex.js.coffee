$.fn.removeClassRegex = (regex) ->
  $(@).removeClass (index, classes) ->
    classes.split(/\s+/).filter (c) ->
      regex.test c
    .join ' '

$.fn.removeClassPrefix = (prefix) ->
  regex = new RegExp("(^|\\s)#{prefix}\\S+", 'g');
  $(@).removeClassRegex regex

