class @Bitcoin extends @BaseCrypto
  """
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  """
  constructor: ->
    super
    @api_url = "http://blockchain.info/address/"
    @code = "BTC"
    @lambda_balance = (result) -> result.data.final_balance / Math.pow(10, 8)
    @name = "Bitcoin"

  set_balance: ->
    url = "#{@api_url}#{@address}?format=json"
    super url, @lambda_balance

  get_value: ->
    MtGox.get_value('btc')
