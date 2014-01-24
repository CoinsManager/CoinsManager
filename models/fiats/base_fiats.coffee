###
Base class for Fiat Currencies
###


class @BaseFiat

  constructor: (@attributes) ->

  printInfo: ->
    "Name: #{@attributes.name}"


exports.BaseFiat = BaseFiat unless Meteor?
