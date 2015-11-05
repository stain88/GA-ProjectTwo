animationHover = (element, animation) ->
  element = $(element)
  element.hover (->
    element.toggleClass "animated " + animation
  )

$ ->
  flashCallback = ->
    $(".alert-info").fadeOut()
  $(".alert-info").bind 'click', (ev) =>
    $(".alert-info").fadeOut()
  setTimeout flashCallback, 3000

  $("button.btn-lg").each ->
    animationHover this, "shake"

  $(".hp-jumb").each ->
    animationHover this, "tada"
