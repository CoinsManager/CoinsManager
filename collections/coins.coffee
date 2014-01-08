@Coins = new Meteor.Collection 'coins'  #, null, null, @BitCoin

#if Meteor.isClient
  #Template.coins.coins ->
    #Coins.find()
