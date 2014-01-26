class @MtGox extends @BaseExchange
  ###
  This class define all the informations needed for the Mt.Gox exchange.
  ###
  @name = 'Mt.Gox'
  @api_url = 'http://data.mtgox.com/api/1/BTCUSD/ticker_fast'

  @set_btc_value = ->
    MtGox.set_value MtGox.api_url, 'btc', (result) ->
      data = result.data.return
      if data.last_all.currency is 'USD'
        +result.data.return.last_all.value_int / Math.pow(10, 5)
      else
        return 0

