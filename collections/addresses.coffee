#blockchain = DDP.connect "ws://ws.blockchain.info/inv"
#blockchain = new WebSocket "ws://ws.blockchain.info/inv"

@Addresses = new Meteor.Collection "addresses",
  transform: (doc) ->
    # Retrieve class from code, and pass it the address
    if doc.code of cryptoClassesList
      new cryptoClassesList[doc.code] doc.address
    else doc


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument
