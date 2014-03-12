class @NobleCoin extends @BaseCrypto
  """
  This class define all the informations needed for NobleCoin
  """
  @api_url = "http://cryptexplorer.com/chain/NobleCoin/q/"
  @code = "NOBL"

  constructor: ->
    super
    @name = "NobleCoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
