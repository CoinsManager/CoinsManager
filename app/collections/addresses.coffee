#blockchain = DDP.connect "ws://ws.blockchain.info/inv"
#blockchain = new WebSocket "ws://ws.blockchain.info/inv"
global = @


Meteor.startup ->
  Meteor.call "implemented_coins", (err, result) ->
    global.implementedCoins = result


@Addresses = new Meteor.Collection "addresses",
  transform: (doc) ->
    # Retrieve class from code, and pass it the address
    if doc.name in global.implementedCoins
      obj = new global[doc.name] doc.address
    else
      obj = new BaseCrypto doc.address
      obj.name = doc.name
      obj.get_balance = -> doc.balance
      obj.set_balance = -> doc.balance
    return obj


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument
