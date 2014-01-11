###
Base Class for Crypto Currencies
###


class @BaseCrypto

  constructor: (@attributes) ->

  printInfo: ->
    "Name: #{@attributes.name}"

  exchanges: ->
    console.log 'Many-to-Many relationship with BaseExchange'
