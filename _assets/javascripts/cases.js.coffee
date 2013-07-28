jQuery ($) ->
  $('#case_container').isotope({
    itemSelector : '.case_item'
  })
  $('#filters a').click (e) ->
    e.preventDefault()
    li = $(this).parent()
    li.siblings('li').removeClass('active')
    li.addClass('active')
    $('#case_container').isotope({ filter: $(this).data('filter') })
  $('.case_item a[rel=casesbox]').bind 'click', (e) ->
    e.preventDefault()
    TINY.box.show({ image: $(this).attr('href') })
