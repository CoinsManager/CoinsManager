class @Kraken extends @BaseWebsite
  """
  All informations required to fetch user wallets from Kraken
  """
  constructor: ->
    super
    @name = "Kraken"

  fetchAddresses: (user) ->
