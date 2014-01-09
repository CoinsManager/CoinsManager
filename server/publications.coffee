Meteor.publish 'coins', () ->
  Coins.find()


Meteor.publish 'exchanges', () ->
  Exchanges.find()
