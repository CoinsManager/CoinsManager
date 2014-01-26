Template.coinsManager.helpers
  addresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find
        userId: coinsManager._id
      address.set_balance() for address in addresses
      return addresses

