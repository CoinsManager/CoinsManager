class @Franko extends @BaseCrypto
  """
  This class define all the informations needed for Franko.
  """
  @code = "FRK"

  constructor: ->
    super
    @api_url = "http://frk.cryptocoinexplorer.com/chain/Franko/q/"
    @lambda_balance = (received, sent) -> (+received - +sent)
    @name = "Franko"
    @cryptocoinchartsName = "FrankoCoin"

  setBalance: ->
    """
    We need to get the "received coins" value, then substract to it the
    "sent coins" value
    """
    cls = this

    # Get received coins data
    received = Meteor.call "callUrl",
      "#{@api_url}getreceivedbyaddress/#{@address}"
      (error, result) ->
        BaseCrypto.keys[cls.name][cls.address].received = result.content

    # Get sent coins data and return result
    Meteor.call "callUrl",
      "#{@api_url}getsentbyaddress/#{@address}"
      (error, result) ->
        sent = result.content
        value = cls.lambda_balance BaseCrypto.keys[cls.name][cls.address].
          received, sent
        if isNaN value
          return
        BaseCrypto.keys[cls.name][cls.address].balance = value
        BaseCrypto.deps[cls.name][cls.address].balance.changed()

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base
