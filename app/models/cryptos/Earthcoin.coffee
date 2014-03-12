class @Earthcoin extends @BaseCrypto
  """
  This class define all the informations needed for Earthcoin.
  """
  @code = "EAC"


  constructor: ->
    super
    @api_url = "http://earthchain.info/chain/Earthcoin/q/addressbalance/"
    @lambda_balance = (result) -> +result.content
    @name = "Earthcoin"
    @cryptocoinchartsName = "EarthCoin"

  setBalance: ->
    url = "#{@api_url}#{@address}"
    super url, @lambda_balance
