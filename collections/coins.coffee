@Coins = new Meteor.Collection 'coins',
    transform: (args) ->
      new @Bitcoin args
