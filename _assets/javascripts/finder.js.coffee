jQuery ($) ->
  $('#finder').isotope
    itemSelector: '.item'
  $('#finder-filter a').click (e) ->
    if $(this).data('filter')
      $('#finder').isotope({ filter: $(this).data('filter') })
