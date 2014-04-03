class @Einsteinium extends @BaseCrypto
  """
  This class define all the informations needed for Einsteinium
  """
  @address_format = "21"
  @api_url = "http://cryptexplorer.com/chain/Einsteinium/q/"
  @code = "EMC2"

  constructor: ->
    super
    @name = "Einsteinium"
    @cryptocoinchartsName = "EMC2"
    @total_coin = "299,792,458"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
