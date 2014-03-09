class @Quark extends @BaseCrypto
  """
  This class define all the informations needed for Quark
  """
  @code = "QRK"
  @api_url = "http://176.221.46.81/chain/Quarkcoin/q/"

  constructor: ->
    super
    @name = "Quark"
    @cryptocoinchartsName = "Quarkcoin"

  set_balance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verify_address: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
