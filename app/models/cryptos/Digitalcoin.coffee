class @Digitalcoin extends @BaseCrypto
  """
  This class define all the informations needed for Franko.
  """
  @address_format = "1E"
  @api_url = "http://dgc.cryptocoinexplorer.com/q/"
  @code = "DGC"

  constructor: ->
    super
    @lambda_balance = (received, sent) -> (+received - +sent)
    @name = "DGC"
    @cryptocoinchartsName = "Digitalcoin"

  setBalance: ->
    """
    We need to get the "received coins" value, then substract to it the
    "sent coins" value
    """
    cls = this

    # Get received coins data
    received = Meteor.call "callUrl",
      "#{@constructor.api_url}getreceivedbyaddress/#{@address}"
      (error, result) ->
        BaseCrypto.keys[cls.name][cls.address].received = result.content

    # Get sent coins data and return result
    Meteor.call "callUrl",
      "#{@constructor.api_url}getsentbyaddress/#{@address}"
      (error, result) ->
        sent = result.content
        value = cls.lambda_balance BaseCrypto.keys[cls.name][cls.address].
          received, sent
        if isNaN value
          return
        BaseCrypto.keys[cls.name][cls.address].balance = value
        BaseCrypto.deps[cls.name][cls.address].balance.changed()
