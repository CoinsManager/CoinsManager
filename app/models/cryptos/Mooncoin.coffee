class @Mooncoin extends @BaseCrypto
  """
  This class define all the informations needed for Mooncoin
  """
  @address_format = "03"
  @api_url = "http://mooncoin.info/abe/chain/Mooncoin/q/"
  @code = "MOON"

  constructor: ->
    super
    @name = "Mooncoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base, @address_format
