Session.set "showCoinForm", false


Template.userAddresses.helpers
  showCoinForm: ->
    Session.get "showCoinForm"
