bitcoin_explorer = "http://blockchain.info/address/"
litecoin_explorer = "http://explorer.litecoin.net/chain/Litecoin/q/"
earthcoin_explorer = "http://earthchain.info/chain/Earthcoin/q/addressbalance/"

Meteor.methods
  get_coin_balance: (crypto, address) ->
    this.unblock()
    switch crypto
      when "btc"
        result = Meteor.http.get "#{bitcoin_explorer}#{address}?format=json"
        return result.data.final_balance / 100000000
      when "ltc"
        received = Meteor.http.get "#{litecoin_explorer}getreceivedbyaddress/#{address}"
        sent = Meteor.http.get "#{litecoin_explorer}getsentbyaddress/#{address}"
        result = (+received.content - +sent.content) / 100000000
        return result
      when "eac"
        result = Meteor.http.get "#{earthcoin_explorer}#{address}"
        return +result.content
      else
        return
