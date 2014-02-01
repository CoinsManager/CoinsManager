Meteor.methods
  call_url: (url) ->
    this.unblock()
    Meteor.http.get url

  verify_address: (address, code) ->
    if code of cryptoClassesList
      cryptoClassesList[code].verify_address address
    else false

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
    if "name" of attributes
      options.name = attributes.name
      options.get_balance = attributes.nb_coin
      options.get_value = attributes.value

    addressId = Addresses.insert options
    return addressId
