###
Base class for Exchanges
###


class @BaseExchange

  constructor: (@attributes) ->

  printInfo: ->
    "Name: #{@attributes.name}"

  get_btc_value: ->
    return -1

exports.BaseExchange = BaseExchange unless Meteor?
