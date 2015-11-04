animationHover = (element, animation) ->
  element = $(element)
  element.hover (->
    element.addClass "animated " + animation
  ), ->
    window.setTimeout (->
      element.removeClass "animated " + animation
    ), 500

$ ->
  flashCallback = ->
    $(".alert").fadeOut()
  $(".alert").bind 'click', (ev) =>
    $(".alert").fadeOut()
  setTimeout flashCallback, 3000

  $(".btn-lg").each ->
    animationHover this, "shake"
