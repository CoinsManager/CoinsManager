class @Execoin extends @BaseCrypto
  """
  This class define all the informations needed for Execoin
  """
  @address_format = "21"
  @api_url = "http://explorer.execoin.net/chain/Execoin/q/"
  @code = "EXE"

  constructor: ->
    super
    @name = "Execoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
