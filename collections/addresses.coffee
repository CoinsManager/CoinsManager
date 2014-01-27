#blockchain = DDP.connect 'ws://ws.blockchain.info/inv'
#blockchain = new WebSocket 'ws://ws.blockchain.info/inv'

@Addresses = new Meteor.Collection 'addresses',
  transform: (args) ->
    # Retrieve class from code, and pass it the address
    if args.code of @cryptoClassesList
      new @cryptoClassesList[args.code] args.address
    else args

