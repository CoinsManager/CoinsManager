class @Tenfive extends @BaseCrypto
  """
  This class define all the informations needed for Mooncoin
  """
  @address_format = "42"
  @api_url = "http://explorer.tenfivecoin.com/chain/Tenfive/q/"
  @code = "10-5"

  constructor: ->
    super
    @name = "Tenfive"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
