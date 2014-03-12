class @Dogecoin extends @BaseCrypto
  """
  This class define all the informations needed for Dogecoin
  """
  @address_format = "CK"
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

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base, @address_format
