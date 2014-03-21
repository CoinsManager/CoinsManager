class @Kraken extends @BaseWebsite
  """
  All informations required to fetch user wallets from Kraken

  Required module:

    $ npm install -g kraken-api

  """
  constructor: ->
    super
    @name = "Kraken"

  @fetchAddresses: (options) ->
    console.log "enter Kraken.fetchAddresses"
    kraken = new KrakenClient options.api_key, options.api_secret
    console.log "call api"
    kraken.api 'Balance', null, (error, data) ->
      if error
        Errors.throw error.reason
      else
        debugger
        console.log data.result
