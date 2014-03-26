class @Greececoin extends @BaseCrypto
  """
  This class define all the informations needed for Greececoin
  """
  @address_format = "26"
  @api_url = "http://cryptoblox.com/chain/Greececoin/q/"
  @code = "GRCE"

  constructor: ->
    super
    @name = "Greececoin"
    @cryptocoinchartsName = "GRCE"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
