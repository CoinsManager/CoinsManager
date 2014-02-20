class @Infinitecoin extends @BaseCrypto
  """
  This class define all the informations needed for Infinitecoin
  """
  @code = "IFC"
  @api_url = "http://exploretheblocks.com:2750/chain/Infinitecoin/q/"

  set_balance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  get_value: ->
    @get_balance() * 0.000092

  @verify_address: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
