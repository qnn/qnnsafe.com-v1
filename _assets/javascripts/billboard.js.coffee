jQuery ($) ->
  loopslider = ->
    active = $('#billboard .bb.active')
    $('.image', active).delay(500).animate { right: "+=50", opacity: 1  }, 200, ->
      $('.title', active).animate { left: "-=50", opacity: 1  }, 200, ->
        $('.subtitle', active).animate({ left: "-=50", opacity: 1  })
        setTimeout ->
          $('.image', active).animate { right: "+=50", opacity: 0  }, 200, ->
            $('.title', active).animate { left: "-=50", opacity: 0  }, 200, ->
              $('.subtitle', active).animate { left: "-=50", opacity: 0  }, 200, ->
                $('.subtitle', active).css({ left: '+=100' })
                $('.image', active).css({ right: '-=100' })
                $('.title', active).css({ left: '+=100' })
                active.find('.link').hide()
                active.removeClass('active')
                if active.next().length > 0
                  next = active.next()
                else
                  next = $('#billboard .bb:first')
                next.addClass('active')
                next.find('.link').show()
                loopslider()
        , 4000
  loopslider()
