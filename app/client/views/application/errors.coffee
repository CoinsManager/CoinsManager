Template.meteorErrors.rendered = ->
  $("html, body").animate
    scrollTop: $(".errors_list").offset().top
    500
