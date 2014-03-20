Template.coinsManager.helpers
  loggedIn: ->
    Meteor.user()


Template.coinsManager.events
  "click #close_donation": (e) ->
    e.preventDefault()
    Session.set "showDonationAddresses", false

  # Top address handler
  "click .top_coin": (e) ->
    $this = $(e.target)
    if $this.hasClass "top_coin" and not $this.hasClass "is_active_top"
      $(".top_coin").removeClass "is_active_top"
      $this.addClass "is_active_top"
