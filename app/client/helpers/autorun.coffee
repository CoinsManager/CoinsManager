Meteor.startup ->
  Meteor.setInterval (->
    url = 'https://api.bitcoinaverage.com/ticker/USD/'
    Meteor.call "call_url", url, (err, result) ->
      """Update the bitcoin value to fiat"""
      if err
        throw new Meteor.Error err.error, err.reason
      else
        BaseCrypto.keys.btc2usd = result.data["24h_avg"]
        BaseCrypto.deps.btc2usd.changed()

    url = "http://www.cryptocoincharts.info/v2/api/listCoins"
    Meteor.call "call_url", url, (err, result) ->
      """Update all currencies values for visible addresses"""
      if err
        throw new Meteor.Error err.error, err.reason
      else
        addresses = Session.get 'visibleAddresses'

        if addresses
          addresses.forEach (address) ->
            # Do not update the value if there is no balance
            if not BaseCrypto.keys[address.name][address.address].balance?
              return

            resultDict = result.data.toDict 'name'
            key = address.name
            if key not of resultDict
              # CryptoCoinCharts sometimes writes the wrong typo for coins
              key = address.name.replace 'coin', 'Coin'
            if key not of resultDict
              return
            # Update key value
            BaseCrypto.keys[address.name][address.address].
              value = +resultDict[key].price_btc
            # Triggers reactivity
            BaseCrypto.deps[address.name][address.address].value.changed()
  ), 3000
