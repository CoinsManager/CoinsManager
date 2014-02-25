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
      doc = new global[doc.name] doc.address
    else
      doc.get_value = -> @value
      doc.get_balance = -> @balance
    return doc


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument
