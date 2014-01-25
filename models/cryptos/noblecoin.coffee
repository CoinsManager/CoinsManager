class @Noblecoin extends @BaseCrypto
  """
  This class define all the informations needed for Noblecoin
  """
  constructor: ->
    super
    @name = "Noblecoin"
    @code = "NOBLE"
    @api_url = "http://cryptexplorer.com/chain/Noblecoin/q/addressbalance/"
    @lambda_balance = (result) -> +result.content

  set_balance: ->
    url = "#{@api_url}#{@address}"
    super url, @lambda_balance

  get_value: ->
    return 5
