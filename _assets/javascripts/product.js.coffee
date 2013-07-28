jQuery ($) ->
  children = $('#showcase > ul > li').length
  count = Math.ceil(children / 6)
  for page in [2..count]
    ul = $('<ul />').insertAfter('#showcase > ul:last')
    for item in [(page-1)*6..page*6-1]
      child = $('#showcase > ul:first > li').eq(item)
      if child.length == 1
        ul.append(child.clone())
  if children > 6
    $('#showcase > ul:first > li').eq(5).nextAll().remove()
  else
    $('#showcase').addClass('shorter')
  if count > 1
    for page in [1..count]
      $('#showcase .nav').append('<a href="#">'+page+'</a>')
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
