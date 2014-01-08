class @Bitcoin extends @BaseCrypto

  constructor: (@attributes) ->
    @attributes.name = @attributes.name or 'Bitcoin'
    @attributes.avg_value = @attributes.avg_value or 1000

exports.Bitcoin = Bitcoin unless Meteor?
