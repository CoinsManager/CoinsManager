class @Quark extends @BaseCrypto
  """
  This class define all the informations needed for Quark
  """
  @address_format = "3A"
  @api_url = "http://176.221.46.81/chain/Quarkcoin/q/"
  @code = "QRK"

  constructor: ->
    super
    @name = "Quark"
    @cryptocoinchartsName = "Quarkcoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
