@Exchanges = new Meteor.Collection 'exchanges',
    transform: (args) ->
      switch args.name
        when "mtgox" then new @MtGox args
        else
          new @BaseExchange args
