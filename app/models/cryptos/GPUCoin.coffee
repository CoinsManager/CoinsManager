class @GPUCoin extends @BaseCrypto
  """
  This class define all the informations needed for GPUCoin
  """
  @address_format = "26"
  @api_url = "http://explorer3.sancrypto.info/chain/GPUCoin/q/"
  @code = "GPUC"

  constructor: ->
    super
    @name = "GPUCoin"
    @cryptocoinchartsName = "GPUC"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
