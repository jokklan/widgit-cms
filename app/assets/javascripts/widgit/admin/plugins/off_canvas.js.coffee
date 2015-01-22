'use strict'
$ = jQuery

$(document).on 'click', '[data-toggle="off-canvas"]', =>
  $offCanvas  = $('.off-canvas')

  if $offCanvas.hasClass 'active'
    $offCanvas.removeClass 'active'
  else
    $offCanvas.addClass 'active'
