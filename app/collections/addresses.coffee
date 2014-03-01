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
      obj.code = doc.code
      obj.set_balance = -> doc.balance
      BaseCrypto.keys[obj.name] = {}
      BaseCrypto.keys[obj.name][obj.address] =
        balance: doc.balance
        total_value: doc.value

    return obj


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument
