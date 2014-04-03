class @Spaincoin extends @BaseCrypto
  """
  This class define all the informations needed for Spaincoin.
  """
  @address_format = "3F"
  @api_url = "http://explorer.spaincoin.org/chain/Spaincoin/q/"
  @code = "SPA"

  constructor: ->
    super
    @name = "Spaincoin"
    @cryptocoinchartsName = "SpainCoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
