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
