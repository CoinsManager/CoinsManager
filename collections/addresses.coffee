#blockchain = DDP.connect 'ws://ws.blockchain.info/inv'
#blockchain = new WebSocket 'ws://ws.blockchain.info/inv'

@Addresses = new Meteor.Collection 'addresses',
  transform: (args) ->
    # TODO: refactore with meteor-dependance
    switch args.code
      when 'BTC' then new @Bitcoin args.address
      when 'EAC' then new @Earthcoin args.address
      when 'LTC' then new @Litecoin args.address
      when 'NOBL' then new @Noblecoin args.address
      else args
