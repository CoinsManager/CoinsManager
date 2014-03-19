class @Vertcoin extends @BaseCrypto
  """
  This class define all the informations needed for Vertcoin
  """
  @address_format = "47"
  @api_url = "https://explorer.vertcoin.org/chain/Vertcoin/q/"
  @code = "VTC"

  constructor: ->
    super
    @name = "Vertcoin"
    @total_coin = "84 million"
    @hash_algo = "Scrypt-Adaptive-NFactor"
    @cryptocoinchartsName = "VertCoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
