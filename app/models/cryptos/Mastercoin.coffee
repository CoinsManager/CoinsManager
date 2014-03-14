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
      content = JSON.parse result.content
      +content[0].balance
    super url, lambda_balance

  @verifyAddress: (address) ->
    url_base = "http://blockexplorer.com/q/checkaddress/"
    super address, url_base, @address_format
