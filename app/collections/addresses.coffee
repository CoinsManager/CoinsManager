#blockchain = DDP.connect "ws://ws.blockchain.info/inv"
#blockchain = new WebSocket "ws://ws.blockchain.info/inv"

Meteor.startup ->
  Meteor.call "implemented_coins", (err, result) ->
    @implementedCoins = result


@Addresses = new Meteor.Collection "addresses",
  transform: (doc) ->
    # Retrieve class from code, and pass it the address
    if doc.code in @implementedCoins
      new @[doc.code] doc.address
    else doc


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument
