Template.coinsManager.helpers
  donationAddresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find({userId: coinsManager._id}, {sort: {name: 1}})
      address.set_balance() for address in addresses
      return addresses
  loggedIn: ->
    Meteor.user()

Template.coinsManager.events
  "click #close_donation": (e) ->
    console.log("close donation")
    $("#donation_block").slideUp()