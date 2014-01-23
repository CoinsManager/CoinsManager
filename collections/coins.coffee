#blockchain = DDP.connect 'ws://ws.blockchain.info/inv'
#blockchain = new WebSocket 'ws://ws.blockchain.info/inv'

@Coins = new Meteor.Collection 'coins',
  #connection: blockchain
  transform: (args) ->
    new @Bitcoin args

@Addresses = new Meteor.Collection 'addresses'
