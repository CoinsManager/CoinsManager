class @Bitcoin extends @BaseCrypto
  ###
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  ###
  name = "Bitcoin"
  code = "BTC"
  api_url = "http://blockchain.info/address/"

  get_balance: (address) ->
    result = Meteor.http.get "#{bitcoin_explorer}#{address}?format=json"
    return result.data.final_balance / Math.pow(10, 8)

exports.Bitcoin = Bitcoin unless Meteor?
