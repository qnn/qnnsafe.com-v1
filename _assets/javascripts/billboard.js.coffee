jQuery ($) ->
  $('.image').delay(500).animate { right: "+=50", opacity: 1  }, 200, ->
    $('.title').animate { left: "-=50", opacity: 1  }, 200, ->
      $('.subtitle').animate({ left: "-=50", opacity: 1  })
