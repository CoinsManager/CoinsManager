Template.coinsManager.helpers
  addresses: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      Addresses.find
        userId: coinsManager._id

#Template.addressItem.helpers
  #nb_coins: (address) ->
    #Meteor.call "get_coin_balance", address, (error, results) ->
      #return results.data.final_balance
    #return "fail"
