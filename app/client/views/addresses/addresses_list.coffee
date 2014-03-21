Template.userAddresses.created = ->
  Session.set "showCoinForm", false
  Session.set "showImportForm", false


Template.userAddresses.helpers
  showCoinForm: ->
    Session.get "showCoinForm"
  showImportForm: ->
    Session.get "showImportForm"
