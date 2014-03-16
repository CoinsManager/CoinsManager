class @Worldcoin extends @BaseCrypto
  """
  This class define all the informations needed for Worldcoin
  """
  @address_format = "49"
  @api_url = "http://wdc.cryptocoinexplorer.com/chain/Worldcoin/q/"
  @code = "WDC"

  constructor: ->
    super
    @cryptocoinchartsName = "WorldCoin"
    @hash_algo = "scrypt"
    @lambda_balance = (received, sent) -> (+received - +sent)
    @name = "Worldcoin"

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

  @verifyAddress: (address) ->
    url_base = "#{@api_url}checkaddress/"
    super address, url_base, @address_format
