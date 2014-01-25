runAnimation = ($obj) ->
  $obj.addClass("is-visible")
  $obj.find("i").addClass("hatch")
  $obj.find("h1").addClass("slideLeft")
  $obj.find("article").addClass("pullUp")

$(window).scroll ->
  $(".tour section").each ->
    imagePos = $(this).offset().top
    topOfWindow = $(window).scrollTop()
    if imagePos < topOfWindow + 600
      runAnimation($(this))

Template.navigation.events =
  "click .main-menu li": (e) ->
      $this = $(e.target)
      scrollTime = 800
      link = $this.data "link"
      $(".main-menu").find(".is-active").removeClass "is-active"
      $this.addClass "is-active"
      $.scrollTo link, scrollTime, {offset: -200}

Template.tour.events =
  "click .subnavigation i": (e) ->
      $this = $(e.target)
      scrollTime = 800
      link = $this.data "link"
      $.scrollTo link, scrollTime, {offset: -200}
