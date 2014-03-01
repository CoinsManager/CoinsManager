Meteor.startup ->
  Meteor.setInterval (->
    url = "http://www.cryptocoincharts.info/v2/api/listCoins"
    console.log 'call cryptocoincharts'
    Meteor.call "call_url", url, (err, result) ->
      if err
        throw new Meteor.Error err.error, err.reason
      else
        addresses = Session.get 'donationAddresses'
        addresses.forEach (address) ->
          resultDict = result.data.toDict 'name'
          try
            BaseCrypto.keys[address.name][address.address].
              value = +resultDict[address.name].price_btc
            BaseCrypto.deps[address.name][address.address].value.changed()
          catch error
            key = address.name.replace 'coin', 'Coin'
            if key of resultDict
              BaseCrypto.keys[address.name][address.address]
                .value = +resultDict[key].price_btc
              BaseCrypto.deps[address.name][address.address].value.changed()
            else
              0
  ), 2000


