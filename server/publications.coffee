Meteor.publish 'exchanges', () ->
  Exchanges.find()


Meteor.publish 'fiats', () ->
  Fiats.find()


Meteor.publish 'users', () ->
  Meteor.users.find()


Meteor.publish 'addresses', () ->
  coinsManager = Meteor.users.findOne
    "emails.address": "coinsmanager@gmail.com"
  Addresses.find
    userId: coinsManager._id
