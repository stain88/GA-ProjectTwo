animationHover = (element, animation) ->
  element = $(element)
  element.hover (->
    element.toggleClass "animated " + animation
  )

$ ->
  flashCallback = ->
    $(".alert").fadeOut()
  $(".alert").bind 'click', (ev) =>
    $(".alert").fadeOut()
  setTimeout flashCallback, 3000

  $("button.btn-lg").each ->
    animationHover this, "shake"

  $(".hp-jumb").each ->
    animationHover this, "tada"
