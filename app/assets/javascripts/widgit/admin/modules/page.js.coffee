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
      error: (xhr, status, err) =>
        if xhr.status == 200
          @showFeedback('Saved', 'success')
        else
          @showFeedback('Error saving. See console for details.', 'danger')
          console.error xhr
          console.error status
          console.error err

  data: ->
    {
      blocks_attributes: $('[data-resource="block"]').map(-> $(this).resource('data')).get()
    }
  
  showFeedback: (message, type)->
    $('.feedback-message').remove()
    $('body').append("<div class='feedback-message alert-#{type}'>#{message}</div>")
    $message = $('.feedback-message')
    
    $.delay 1, -> $message.addClass 'show-message' # delay to enable css-animation on dom insertion
    $.delay 3000, -> $message.removeClass 'show-message'



$(document).ready ->
  window.page = new Page()

