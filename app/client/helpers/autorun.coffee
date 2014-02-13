Meteor.startup ->
  #Deps.autorun -> MtGox.set_btc_value()
  Meteor.setInterval MtGox.set_btc_value, 2000
  # TODO: Fix bug dependency key has no method changed()
  #       and remove following line
  MtGox.get_value "btc"
