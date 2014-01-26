Template.coinsManager.helpers
  addresses: ->
    Meteor.setInterval MtGox.set_btc_value, 2000
    #Deps.autorun(-> MtGox.set_btc_value)

    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find
        userId: coinsManager._id
      address.set_balance() for address in addresses
      return addresses

