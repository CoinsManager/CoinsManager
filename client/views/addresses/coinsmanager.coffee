Template.coinsManager.helpers
  donationAddresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find({userId: coinsManager._id}, {sort: {name: 1}})
      address.set_balance() for address in addresses
      return addresses
