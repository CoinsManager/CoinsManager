###
Base class for Exchanges
###


class @BaseExchange

  constructor: (@attributes) ->

  printInfo: ->
    "Name: #{@attributes.name}"


exports.BaseExchange = BaseExchange unless Meteor?
