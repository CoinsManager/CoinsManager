@Exchanges = new Meteor.Collection 'exchanges',
    transform: (args) ->
      new @BaseExchange args
