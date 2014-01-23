if Coins.find().count() is 0
  Coins.insert
    avg_value: 2000
  Coins.insert
    name: 'Litecoin'
    avg_value: 40
  Coins.insert
    name: 'NameCoin'
    avg_value: 8
  Coins.insert
    name: 'FeatherCoin'
    avg_value: 5


if Exchanges.find().count() is 0
  names = ['Mt.Gox', 'Bitstamp', 'Vircurex', 'BTC-e', 'BTCChina']
  Exchanges.insert {name: name} for name in names


if Fiats.find().count() is 0
  names = ['USD', 'EUR', 'JPY', 'AUD']
  Fiats.insert {name: name} for name in names


if Meteor.users.find().count() is 0
  coinsManagerId = Meteor.users.insert
    userId: 1
    emails:
      address: "coinsmanager@gmail.com"

  Addresses.insert
    userId: coinsManagerId
    crypto: "btc"
    address: "1CoinsMPAy5Mz5SVzeAmU6qNmUThiLXYv1"

  Addresses.insert
    userId: coinsManagerId
    crypto: "btc"
    address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

