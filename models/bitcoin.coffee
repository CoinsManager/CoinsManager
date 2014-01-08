class @Bitcoin extends @BaseCrypto
  ###
  This class define all the informations needed for Bitcoin.
  The average value corresponds to the user favorite fiat currency.
  ###

  constructor: (@attributes) ->
    @attributes.name = @attributes.name or 'Bitcoin'
    @attributes.avg_value = @attributes.avg_value or 1000

exports.Bitcoin = Bitcoin unless Meteor?
