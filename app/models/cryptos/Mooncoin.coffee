class @Mooncoin extends @BaseCrypto
  """
  This class define all the informations needed for Mooncoin
  """
  @code = "MOON"
  @api_url = "http://mooncoin.info/abe/chain/Mooncoin/q/"

  set_balance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verify_address: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
