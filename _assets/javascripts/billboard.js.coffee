jQuery ($) ->
  $('#billboard .bb').each (a,b) ->
    $('.image', b).delay(500).animate { right: "+=50", opacity: 1  }, 200, ->
      $('.title', b).animate { left: "-=50", opacity: 1  }, 200, ->
        $('.subtitle', b).animate({ left: "-=50", opacity: 1  })
