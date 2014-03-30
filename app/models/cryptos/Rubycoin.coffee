class @Rubycoin extends @BaseCrypto
  """
  This class define all the informations needed for Mooncoin
  """
  @address_format = "3D"
  @api_url = "http://explorer.rubycoin.org/chain/Rubycoin/q/"
  @code = "RUBY"

  constructor: ->
    super
    @name = "Rubycoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
