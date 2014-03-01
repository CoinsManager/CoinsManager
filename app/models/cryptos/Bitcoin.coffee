class @Bitcoin extends @BaseCrypto
  """
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  """
  @code = "BTC"
  @api_url = "http://blockexplorer.com/q/"

  set_balance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verify_address: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
