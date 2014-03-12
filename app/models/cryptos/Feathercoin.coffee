class @Feathercoin extends @BaseCrypto
  """
  This class define all the informations needed for Feathercoin
  """
  @address_format = "0E"
  @api_url = "https://explorer.feathercoin.com/chain/Feathercoin/q/"
  @code = "FTC"

  constructor: ->
    super
    @name = "Feathercoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base, @address_format
