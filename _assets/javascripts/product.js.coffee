jQuery ($) ->
  $('#showcase').catslider();
  $('.page_nav').find('a').click (e) ->
    e.preventDefault()
    $(this).parent().siblings('li').removeClass('active')
    $(this).parent().addClass('active')
    index = $(this).parent().index()
    children = $(this).closest('.page_nav').siblings('.pages').children()
    children.filter(':visible').fadeOut 'fast', ->
      children.eq(index).fadeIn 'fast'
