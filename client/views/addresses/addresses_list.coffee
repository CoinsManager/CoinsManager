Template.userAddresses.helpers
  addresses: ->
    addresses = Addresses.find
      userId: Meteor.user._id
    address.set_balance() for address in addresses
    return addresses
