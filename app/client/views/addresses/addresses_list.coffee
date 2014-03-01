Template.userAddresses.helpers
  userAddresses: ->
    addresses = Addresses.find
      userId: Meteor.user()._id
    return addresses
