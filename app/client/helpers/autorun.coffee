Meteor.startup ->
  @counter = 0
  # 3rd part apis are not Meteor projects, therefore we cannot get the prices
  # updates reactively, a setInterval is required.
  @timer = Meteor.setInterval callApis, counter


callApis = ->
  # Get The Bitcoin to USD price
  fiat = "USD"
  user = Meteor.user()
  if user and "fiat" of user
    fiat = user.fiat
  url = "https://api.bitcoinaverage.com/ticker/#{fiat}/"
  Meteor.call "callUrl", url, (err, result) ->
    if err
      throw new Meteor.Error err.error, err.reason
    else
      BaseCrypto.keys.btc2usd = result.data["24h_avg"]
      BaseCrypto.deps.btc2usd.changed()

  # Get the alt coins to BTC prices
  url = "http://www.cryptocoincharts.info/v2/api/listCoins"
  Meteor.call "callUrl", url, (err, result) ->
    if err
      throw new Meteor.Error err.error, err.reason
    else
      addresses = Session.get "visibleAddresses"

      if addresses
        addresses.forEach (address) ->
          # Do not update the value if there is no balance
          if not BaseCrypto.keys[address.name][address.address].balance?
            return

          resultDict = result.data.toDict "name"
          key = address.name
          if key not of resultDict
            key = address.cryptocoinchartsName

          # More tests for Non-implemented coins
          if key not of resultDict
            # CryptoCoinCharts sometimes writes the wrong typo for coins
            key = address.name.replace "coin", "Coin"
          if key not of resultDict
            # CryptoCoinCharts randomly choose to use a coin name or code...
            key = address.code
          if key not of resultDict
            return

          # Update key value
          BaseCrypto.keys[address.name][address.address].
            value = +resultDict[key].price_btc
          # Triggers reactivity
          BaseCrypto.deps[address.name][address.address].value.changed()

  if @counter < 10000
    # Trick to call the apis frequently when the page is open, then
    # progressively lower the frequency. From 0 to 10seconds between each call
    @counter += 1000
    Meteor.clearInterval @timer
    @timer = Meteor.setInterval callApis, counter
