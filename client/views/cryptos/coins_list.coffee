bitcoin_address = "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

Template.coinsList.helpers
  coins: ->
    Coins.find()
  #blockchain: ->
    #blockchain = new WebSocket 'ws://ws.blockchain.info:8335/inv'
    #blockchain.onopen = (evt) ->
      #blockchain.send {"op":"addr_sub", "addr":"$bitcoin_address"}
    #blockchain.onmessage = (evt) ->
      #console.log k for k in evt.data
    #return
