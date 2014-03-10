class @Peercoin extends @BaseCrypto
  """
  This class define all the informations needed for Peercoin
  """
  @code = "PPC"
  @api_url = "http://ppc.blockr.io/api/v1/address/info/"

  constructor: ->
    super
    @name = "Peercoin"

  set_balance: ->
    url = "#{@constructor.api_url}#{@address}"
    lambda_balance = (result) -> +result.data.data.balance
    super url, lambda_balance

  @verifyAddress: (address) ->
    result = Meteor.call "callUrl", "#{@api_url}#{address}"
    if not result.data.data.is_valid
      throw new Meteor.Error 605, "Address incorrect"
    return false
