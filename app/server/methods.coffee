"""
Methods:

  * addAddress
  * callUrl
  * removeAddress
  * setFiatPreference
  * verifyAddress
"""
global = @  # Shortcut to access Cryptocoins global vars, cf l.11

readDir = (path) ->
  files = fs.readdirSync path
  file.replace(".coffee.js", "") for file in files.filter (file) ->
    file.search("(base_crypto*)|(js.map)") is -1

Meteor.methods
  addAddress: (attributes) ->
    user = Meteor.user()
    options =
      address: attributes.address
      name: attributes.name
      userId: user._id

    sameAddress = Addresses.findOne options

    if not user
      throw new Meteor.Error 401, "You need to login to add a new address"
    if not attributes.address
      throw new Meteor.Error 411, "Address is empty"
    if not attributes.name
      # TODO: remove this part, name should be found automatically
      throw new Meteor.Error 422, "Please fill the name input"
    if attributes.address and sameAddress
      # TODO: Only applies this rule to verified addresses
      throw new Meteor.Error 302, "This address already exists"

    options.userId = user._id
    if "code" of attributes
      options.code = attributes.code
      options.balance = +attributes.nb_coin
      options.value = +attributes.value

    addressId = Addresses.insert options
    return addressId

  callUrl: (url) ->
    @unblock()
    try
      Meteor.http.get url
    catch error
      content: error.stack

  implementedCoins: ->
    """
    Returns a list of coins that have been implemented
    """
    readDir "./app/models/cryptos/"

  removeAddress: (options) ->
    user = Meteor.user()
    options.userId = user._id

    if not user
      throw new Meteor.Error 401, "You need to login to remove the address"

    if Addresses.findOne options
      Addresses.remove options
    else
      throw new Meteor.Error 302, "This address doesn't exist"

  setFiatPreference: (fiat) ->
    user = Meteor.user()
    Meteor.users.update(
      {_id: user._id}
      $set:
        fiat: fiat
    )

  verifyAddress: (address) ->
    """
    Returns a list of coins that have been implemented ank
    match the given address format
    """
    address_format = BaseCrypto.getAddressFormat address
    matches = []

    coins = readDir "./app/models/cryptos/"

    for name in coins
      if global[name].address_format is address_format
        matches.push name
    return matches
