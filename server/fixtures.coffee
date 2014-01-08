##Meteor.startup ->
  ##if Meteor.coins.find().count() is 0
#if Coins.find().count() is 0
  #Coins.insert
    #name: 'Bob'
    #avg_value: 2000
