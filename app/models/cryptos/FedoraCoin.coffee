class @FedoraCoin extends @BaseCrypto
  """
  This class define all the informations needed for FedoraCoin
  """
  @address_format = "21"
  @api_url = "http://fedoracha.in/chain/FedoraCoin/q/"
  @code = "TIPS"

  constructor: ->
    super
    @name = "FedoraCoin"
    @cryptocoinchartsName = "Fedoracoin"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
