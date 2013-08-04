jQuery ($) ->
  $('.page_nav li.active a').bind 'click', (e) ->
    dropdown = $(this).closest('.page_nav').find('.dropdown')
    if dropdown.is(':visible')
      e.preventDefault()
      dropdown.find('a').trigger('click')
  $('.page_nav li.dropdown a').bind 'click', (e) ->
    e.preventDefault()
    that = $(this)
    if that.text() == '▼'
      $('.page_nav').fadeOut 'fast', ->
        that.parent('li').siblings().andSelf().addClass('dropshow')
        that.text('▲')
        $(this).fadeIn 'fast'
        $('html, body').animate({ scrollTop: 100 }, 200)
    else
      $('.page_nav').fadeOut 'fast', ->
        that.parent('li').siblings().andSelf().removeClass('dropshow')
        that.text('▼')
        $(this).fadeIn 'fast'
