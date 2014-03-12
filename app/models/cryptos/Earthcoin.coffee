class @Earthcoin extends @BaseCrypto
  """
  This class define all the informations needed for Earthcoin.
  """
  @address_format = "5D"
  @api_url = "http://earthchain.info/chain/Earthcoin/q/"
  @code = "EAC"


  constructor: ->
    super
    @lambda_balance = (result) -> +result.content
    @name = "Earthcoin"
    @cryptocoinchartsName = "EarthCoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    super url, @lambda_balance

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base, @address_format
