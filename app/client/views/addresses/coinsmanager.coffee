Template.coinsManager.helpers
  loggedIn: ->
    Meteor.user()


Template.coinsManager.events
  "click #close_donation": (e) ->
    e.preventDefault()
    #$("#donation_block").slideUp()
    Session.set "showDonationAddresses", false
