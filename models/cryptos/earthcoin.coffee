class @Earthcoin extends @BaseCrypto
  """
  This class define all the informations needed for Earthcoin.
  """
  constructor: ->
    super
    @api_url = "http://earthchain.info/chain/Earthcoin/q/addressbalance/"
    @code = "EAC"
    @lambda_balance = (result) -> +result.content
    @name = "Bitcoin"

  set_balance: ->
    url = "#{@api_url}#{@address}"
    super url, @lambda_balance

  get_value: ->
    return 5
