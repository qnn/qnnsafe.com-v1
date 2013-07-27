jQuery ($) ->
  $('#case_container').isotope({
    itemSelector : '.case_item'
  })
  $('#filters a').click ->
    li = $(this).parent()
    li.siblings('li').removeClass('active')
    li.addClass('active')
    $('#case_container').isotope({ filter: $(this).data('filter') })
