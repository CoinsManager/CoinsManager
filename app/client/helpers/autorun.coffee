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
          if not BaseCrypto.keys[address.name][address.address].balance
            return

          resultDict = result.data.toDict 'name'
          key = address.name
          if key not of resultDict
            key = address.name.replace 'coin', 'Coin'
          if key not of resultDict
            return
          BaseCrypto.keys[address.name][address.address].
            value = +resultDict[key].price_btc
          BaseCrypto.deps[address.name][address.address].value.changed()
  ), 2000


