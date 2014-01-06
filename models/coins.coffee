class BaseCoin

  constructor: (@attributes) ->

  printInfo: ->
    console.log "Name: #{attributes.name}"

  exchanges: ->
    console.log 'Many-to-Many relationship with BaseExchange'


class Bitcoin extends BaseCoin

  constructor: ->
    @name = 'Bitcoin'
    @avg_value = 1000


exports.BaseCoin = BaseCoin unless Meteor?
exports.Bitcoin = Bitcoin unless Meteor?
