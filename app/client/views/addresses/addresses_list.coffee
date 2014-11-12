Template.userAddresses.created = ->
  Session.set "showCoinForm", false
  Session.set "showImportForm", false


Template.userAddresses.helpers
  showCoinForm: ->
    Session.get "showCoinForm"
  showImportForm: ->
    Session.get "showImportForm"
  kraken_balance: ->
    Session.get "kraken_balance"
  kraken_time: ->
    Session.get "kraken_time"
  kraken_assets: ->
    Session.get "kraken_assets"
  kraken_ticker: ->
    Session.get "kraken_ticker"
  kraken_spread: ->
    "OHOHOHO " + Session.get "kraken_spread"
