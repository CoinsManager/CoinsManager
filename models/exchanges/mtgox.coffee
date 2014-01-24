class @MtGox extends @BaseExchange
  ###
  This class define all the informations needed for the Mt.Gox exchange.
  ###
  name = 'Mt.Gox'
  api_url = 'http://data.mtgox.com/api/1/BTCUSD/ticker_fast'

  get_btc_value: ->
    result = Meteor.http.get @api_url
    return +result.data.return.now


exports.Bitcoin = Bitcoin unless Meteor?
