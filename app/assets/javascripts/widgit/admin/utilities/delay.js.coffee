# beautifying setTimeout. Use like: $.delay 10, -> doSomething
$.delay = (time, callback) ->
  setTimeout callback, time