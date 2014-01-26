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
    balance = @get_balance()
    #_.isNumber(balance) and balance * MtGox.get_value('btc') or balance
    # Just return Bitcoin value until we get a donation
    MtGox.get_value('btc')
