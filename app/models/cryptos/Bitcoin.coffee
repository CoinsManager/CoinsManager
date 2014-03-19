class @Bitcoin extends @BaseCrypto
  """
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  """
  @address_format = "00"
  @api_url = "http://blockexplorer.com/q/"
  @code = "BTC"

  constructor: ->
    super
    @name = "Bitcoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
