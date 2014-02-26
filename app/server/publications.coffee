Meteor.publish 'users', () ->
  Meteor.users.find
    $or: [
      {_id: @userId},
      {"emails.address": "coinsmanager@gmail.com"},
    ]


Meteor.publish 'donationAddresses', () ->
  coinsManager = Meteor.users.findOne
    "emails.address": "coinsmanager@gmail.com"
  Addresses.find
    userId: coinsManager._id

Meteor.publish 'userAddresses', (userId) ->
  Addresses.find
    userId: userId
