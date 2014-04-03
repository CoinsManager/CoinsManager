class @Auroracoin extends @BaseCrypto
  """
  This class define all the informations needed for AuroraCoin.
  """
  @address_format = "17"
  @api_url = "http://blockexplorer.auroracoin.eu/chain/AuroraCoin/q/"
  @code = "AUR"

  constructor: ->
    super
    @name = "Auroracoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
