Template.coinsManager.helpers
  loggedIn: ->
    Meteor.user()


Template.coinsManager.events
  "click #close_donation": (e) ->
    e.preventDefault()
    Session.set "showDonationAddresses", false
