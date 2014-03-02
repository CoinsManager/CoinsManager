Template.coinsManager.helpers
  loggedIn: ->
    Meteor.user()


Template.coinsManager.events
  "click #close_donation": (e) ->
    $("#donation_block").slideUp()
