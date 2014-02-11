#blockchain = DDP.connect "ws://ws.blockchain.info/inv"
#blockchain = new WebSocket "ws://ws.blockchain.info/inv"

if Meteor.isReady
  @implementedCoins = Meteor.call "implemented_coins"


@Addresses = new Meteor.Collection "addresses",
  transform: (doc) ->
    # Retrieve class from code, and pass it the address
    if doc.code in @implementedCoins
      new @[doc.code] doc.address
    else doc


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument
