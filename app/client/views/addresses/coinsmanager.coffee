Template.coinsManager.helpers
  donationAddresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find
        userId: coinsManager._id
      addresses = addresses.fetch().sort (a, b) ->
        a = a.get_balance()
        b = b.get_balance()
        if not _.isNumber a
          a = -1
        if not _.isNumber b
          b = -1
        b - a
      return addresses
  loggedIn: ->
    Meteor.user()

Template.coinsManager.events
  "click #close_donation": (e) ->
    $("#donation_block").slideUp()
