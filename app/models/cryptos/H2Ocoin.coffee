class @H2Ocoin extends @BaseCrypto
  """
  This class define all the informations needed for H2Ocoin
  """
  @address_format = "28"
  @api_url = "http://cryptexplorer.com/chain/H2Ocoin/q/"
  @code = "H2O"

  constructor: ->
    super
    @name = "H2Ocoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
