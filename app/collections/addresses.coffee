#blockchain = DDP.connect 'ws://ws.blockchain.info/inv'
#blockchain = new WebSocket 'ws://ws.blockchain.info/inv'

@Addresses = new Meteor.Collection 'addresses',
  transform: (doc) ->
    # Retrieve class from code, and pass it the address
    if doc.code of cryptoClassesList
      new cryptoClassesList[doc.code] doc.address
    else doc


Addresses.allow
  update: @ownsDocument
  remove: @ownsDocument


Meteor.methods
  add_address: (attributes) ->
    user = Meteor.user()
    options =
      address: attributes.address
      code: attributes.code

    sameAddress = Addresses.findOne options

    if not user
      throw new Meteor.Error 401, "You need to login to add a new address"
    if not attributes.code
      # TODO: remove this part, code should be found automatically
      throw new Meteor.Error 422, "Please fill the code input"
    if attributes.address and sameAddress
      # TODO: Only applies this rule to verified addresses
      throw new Meteor.Error 302, "This address already exists"

    options.userId = user._id
    if 'name' of attributes
      options.name = attributes.name
      options.get_balance = attributes.nb_coin
      options.get_value = attributes.value

    addressId = Addresses.insert options
    return addressId
