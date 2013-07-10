jQuery ($) ->
  # hover effects of links in product catalog popup
  sc_size = -110
  $('ul.model').each (a,b) ->
    figure = $(b).siblings('.figure')
    $('a', b).hover ->
      index = $(this).parent().index()
      figure.css('background-position', (a * sc_size) + 'px ' + (index * sc_size) + 'px' )
  # click to open product catalog
  $.extend $.easing,
    easeInQuart: (x, t, b, c, d) ->
      c * (t /= d) * t * t * t + b
    easeOutQuart: (x, t, b, c, d) ->
      -c * ((t = t / d - 1) * t * t * t - 1) + b
  $('#nav-catalog').addClass('inactive').click (e) ->
    e.preventDefault()
    that = $(this)
    if that.hasClass('inactive')
      that.parent().addClass('active')
      $('#catalog').animate { top: 37 }, 200, 'easeOutQuart', ->
        that.removeClass('inactive').addClass('active')
    else if that.hasClass('active')
      that.parent().removeClass('active')
      $('#catalog').animate { top: -500 }, 200, 'easeInQuart', ->
        that.removeClass('active').addClass('inactive')
