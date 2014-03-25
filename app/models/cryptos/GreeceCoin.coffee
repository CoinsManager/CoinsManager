class @GreeceCoin extends @BaseCrypto
  """
  This class define all the informations needed for GreeceCoin
  """
  @address_format = "26"
  @api_url = "http://cryptoblox.com/chain/GreeceCoin/q/"
  @code = "GRCE"

  constructor: ->
    super
    @name = "GreeceCoin"
    @cryptocoinchartsName = "GRCE"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
