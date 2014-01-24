Meteor.methods
  check_bitcoin: (address) ->
    this.unblock()
    Meteor.http.get "http://blockchain.info/address/#{address}?format=json"
