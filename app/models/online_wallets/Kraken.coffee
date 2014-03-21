class @Kraken extends @BaseWebsite
  """
  All informations required to fetch user wallets from Kraken

  Required module:

    $ npm install -g kraken-api

  """
  constructor: ->
    super
    @name = "Kraken"

  fetchAddresses: (user) ->
