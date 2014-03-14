Template.coinsManager.helpers
  loggedIn: ->
    Meteor.user()

Template.addressItem.rendered = ->
  $(".address").slice(0,3).addClass "top_coin"
  $(".address:eq(0)").addClass "first"
  $(".address:eq(1)").addClass "second"
  $(".address:eq(2)").addClass "third"

  $(window).scroll () ->
    imagePos = $(".received").offset().top
    topOfWindow = $(window).scrollTop()
    if imagePos < topOfWindow+400
      $(".first").addClass "slideUp"
      $(".second").addClass "bigEntranceToSmall"
      $(".third").addClass "bigEntranceToMini"

Template.coinsManager.events
  "click #close_donation": (e) ->
    e.preventDefault()
    Session.set "showDonationAddresses", false

  # Top address handler
  "click .top_coin": (e) ->
    $this = $(e.target)
    if $this.hasClass("top_coin") and not $this.hasClass("first")
      position = null
      if $this.hasClass "second"
        position = "second"
      else
        position = "third"
      $this.removeClass "third second"
      $(".top_coin.first").addClass position
      $(".top_coin").removeClass "first"
      $this.addClass "first"