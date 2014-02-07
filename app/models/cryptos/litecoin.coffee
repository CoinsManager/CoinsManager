class @Litecoin extends @BaseCrypto
  """
  This class define all the informations needed for Litecoin.
  """
  @code = "LTC"

  constructor: ->
    super
    @api_url = "http://explorer.litecoin.net/chain/Litecoin/q/"
    @lambda_balance = (received, sent) -> (+received - +sent) / Math.pow(10, 8)

  set_balance: ->
    """
    We need to get the "received coins" value, then substract to it the
    "sent coins" value
    """
    cls = this

    # Get received coins data
    received = Meteor.call "call_url",
      "#{@api_url}getreceivedbyaddress/#{@address}"
      (error, result) ->
        cls.keys['received'] = result.content

    # Get sent coins data and return result
    Meteor.call "call_url",
      "#{@api_url}getsentbyaddress/#{@address}"
      (error, result) ->
        sent = result.content
        cls.keys['balance'] = cls.lambda_balance(cls.keys['received'], sent)
        cls.deps['balance'].changed()

  get_value: ->
    @get_balance() * 23.02


@cryptoClassesList[@Litecoin.code] = @Litecoin
