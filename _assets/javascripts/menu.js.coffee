jQuery ($) ->
  sc_size = -110
  $('ul.model').each (a,b) ->
    figure = $(b).siblings('.figure')
    $('a', b).hover ->
      index = $(this).parent().index();
      figure.css('background-position', (a * sc_size) + 'px ' + (index * sc_size) + 'px' )
