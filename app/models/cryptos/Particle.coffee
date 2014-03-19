class @Particle extends @BaseCrypto
  """
  This class define all the informations needed for Particle
  """
  @address_format = "38"
  @api_url = "http://chaincollider.bitparticle.com/chain/Particle/q/"
  @code = "PRT"

  constructor: ->
    super
    @name = "Particle"

  setBalance: ->
    url = "#{@constructor.api_url}addressbalance/#{@address}"
    lambda_balance = (result) -> +result.content
    super url, lambda_balance
