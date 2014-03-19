class @Mastercoin extends @BaseCrypto
  """
  This class define all the informations needed for Mastercoin.
  The average value corresponds to the user favorite fiat currency.
  """
  @address_format = "00"
  @code = "MSC"

  constructor: ->
    super
    @name = "Mastercoin"

  setBalance: ->
    url = "https://masterchain.info/addr/#{@address}.json"
    lambda_balance = (result) ->
      try
        content = JSON.parse result.content
        +content[0].balance
      catch error
        # Address not found on blockchain
        return 0
    super url, lambda_balance
