if Meteor.isServer
  KrakenClient = Meteor.require "kraken-api"


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
    kraken = new KrakenClient options.api_key, options.api_secret
    console.log "start"
    kraken.api 'Balance', null, (error, data) ->
      if error
        console.log "########### 1a"
        console.log error.reason
        #throw new Meteor.Error error.error, error.reason
      else
        console.log "########### 1"
        console.log data.result
    kraken.api 'Time', null, (error, data) ->
      if error
        console.log "########### 2a"
        console.log error.reason
      else
        console.log "########### 2"
        console.log data.result
    kraken.api 'Assets', null, (error, data) ->
      if error
        console.log "########### 3a"
        console.log error.reason
      else
        console.log "########### 3"
        console.log data.result
    kraken.api 'Ticker', null, (error, data) ->
      if error
        console.log "########### 4a"
        console.log error.reason
      else
        console.log "########### 4"
        console.log data.result
    kraken.api 'Spread', null, (error, data) ->
      if error
        console.log "########### 5a"
        console.log error.reason
      else
        console.log "########### 5"
        console.log data.result
    console.log "end"
