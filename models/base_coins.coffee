###
Base Class for Crypto Currencies
###


class @BaseCrypto

  constructor: (@attributes) ->

  printInfo: ->
    console.log "Name: #{attributes.name}"

  exchanges: ->
    console.log 'Many-to-Many relationship with BaseExchange'


exports.BaseCrypto = @BaseCrypto unless Meteor?


###
1st coin added to CoinsManager
Please reuse that file to add new coins.

TODO: Find a way to split code over several files
Following is not working:

  #= require "./base_coins"

###


class Bitcoin extends @BaseCrypto

  constructor: ->
    @name = 'Bitcoin'
    @avg_value = 1000


exports.Bitcoin = Bitcoin unless Meteor?
