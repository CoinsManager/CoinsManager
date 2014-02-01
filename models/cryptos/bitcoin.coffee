class @Bitcoin extends @BaseCrypto
  """
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  """
  @code = "BTC"

  constructor: ->
    super
    @api_url = "http://blockchain.info/address/"
    @lambda_balance = (result) -> result.data.final_balance / Math.pow(10, 8)
    @name = "Bitcoin"

  set_balance: ->
    url = "#{@api_url}#{@address}?format=json"
    super url, @lambda_balance

  get_value: ->
    balance = @get_balance()
    #_.isNumber(balance) and balance * MtGox.get_value("btc") or balance
    # Just return Bitcoin value until we get a donation
    MtGox.get_value("btc")

  @verify_address: (address) ->
    url = "http://blockexplorer.com/q/checkaddress/"  + address
    result = Meteor.call "call_url", url
    switch result.content
      when "X5" then throw new Meteor.Error 600, "Address not base58"
      when "SZ" then throw new Meteor.Error 600, "Address not the correct size"
      when "CK" then throw new Meteor.Error 600, "Failed hash check"
      when "00" then true
      else throw new Meteor.Error 600, "An error occured"


@cryptoClassesList[@Bitcoin.code] = @Bitcoin
