bitcoin_explorer = "http://blockchain.info/address/"
litecoin_explorer = "http://explorer.litecoin.net/chain/Litecoin/q/"

Meteor.methods
  get_coin_balance: (crypto, address) ->
    this.unblock()
    switch crypto
      when "btc"
        result = Meteor.http.get "#{bitcoin_explorer}#{address}?format=json"
        return result.data.final_balance
      when "ltc"
        received = Meteor.http.get "#{litecoin_explorer}getreceivedbyaddress/#{address}"
        sent = Meteor.http.get "#{litecoin_explorer}getsentbyaddress/#{address}"
        result = +received.content - +sent.content
        console.log +received.content
        console.log +sent.content
        console.log +received.content - +sent.content
        return result
      else
        return
