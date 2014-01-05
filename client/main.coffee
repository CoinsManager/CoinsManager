runAnimation = ($obj) ->
  $obj.addClass("is-visible")
  $obj.find("i").addClass("hatch")
  $obj.find("h1").addClass("slideLeft")
  $obj.find("article").addClass("fadeIn")

$(window).scroll ->
  $(".tour section").each ->
    imagePos = $(this).offset().top
    topOfWindow = $(window).scrollTop()
    if imagePos < topOfWindow + 600
      runAnimation($(this))
