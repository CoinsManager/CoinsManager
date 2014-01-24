Template.coinsManager.helpers
  addresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      Addresses.find
        userId: coinsManager._id

