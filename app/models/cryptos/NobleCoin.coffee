class @NobleCoin extends @BaseCrypto
  """
  This class define all the informations needed for NobleCoin
  """
  @code = "NOBL"
  @api_url = "http://cryptexplorer.com/chain/NobleCoin/q/"

  set_balance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  get_value: ->
    @get_balance() * 0.00073

  @verify_address: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
