class @Dogecoin extends @BaseCrypto
  """
  This class define all the informations needed for Dogecoin
  """
  @address_format = "1E"
  @api_url = "http://dogechain.info/chain/Dogecoin/q/"
  @code = "DOGE"

  constructor: ->
    super
    @name = "Dogecoin"
    @cryptocoinchartsName = "DogeCoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
