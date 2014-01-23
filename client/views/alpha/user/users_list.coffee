Template.coinsManager.helpers
  addresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      Addresses.find
        userId: coinsManager._id

Template.addressItem.helpers
  nb_coins: (address) ->
    value = -1
    Meteor.call "check_bitcoin", (error, results) ->
      value = results.data.final_balance
    return value
