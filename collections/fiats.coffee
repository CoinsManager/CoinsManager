@Fiats = new Meteor.Collection 'fiats',
    transform: (args) ->
      new @BaseFiat args
