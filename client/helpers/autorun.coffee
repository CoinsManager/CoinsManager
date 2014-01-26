Meteor.startup ->
  #Deps.autorun(-> MtGox.set_btc_value)
  Meteor.setInterval MtGox.set_btc_value, 2000
