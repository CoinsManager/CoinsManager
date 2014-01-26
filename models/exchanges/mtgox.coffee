class @MtGox extends @BaseExchange
  ###
  This class define all the informations needed for the Mt.Gox exchange.
  ###
  @name = 'Mt.Gox'
  @api_url = 'http://data.mtgox.com/api/1/BTCUSD/ticker_fast'

  @set_btc_value = ->
    @set_value @api_url, 'btc', (result) ->
      +result.data.return.now
