class @Octocoin extends @BaseCrypto
  """
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  """
  @address_format = "12"
  @api_url = "http://explorer.octocoin.org/chain/OctoCoin/q/"
  @code = "888"

  constructor: ->
    super
    @name = "Octocoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
