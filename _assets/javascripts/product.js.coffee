jQuery ($) ->
  $('#showcase').catslider();
  $('.page_nav.is_pager').find('a').click (e) ->
    e.preventDefault()
    $(this).parent().siblings('li').removeClass('active')
    $(this).parent().addClass('active')
    index = $(this).parent().index()
    children = $(this).closest('.page_nav').siblings('.pages').children()
    children.filter(':visible').fadeOut 'fast', ->
      children.eq(index).fadeIn 'fast'

  $('#product_details .cc .image').delay(500).animate { right: "+=50", opacity: 1  }, 200, ->
    $('#product_details .cc .title').animate { left: "-=50", opacity: 1  }, 200
  $('#product_details .cc').hover ->
    $(this).find('.hover').removeClass('hidden')
  , ->
    $(this).find('.hover').addClass('hidden')
