class @RotoCoin extends @BaseCrypto
  """
  This class define all the informations needed for Mooncoin
  """
  @address_format = "3D"
  @api_url = "http://cryptexplorer.com/chain/rotoCoin/q/"
  @code = "RT2"

  constructor: ->
    super
    @name = "RotoCoin"
    @cryptocoinchartsName = "RT2"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
