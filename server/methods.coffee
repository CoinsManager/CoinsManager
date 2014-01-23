bitcoin_address = "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

Meteor.methods
  check_bitcoin: ->
    this.unblock()
    Meteor.http.get "http://blockchain.info/address/16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5?format=json"
