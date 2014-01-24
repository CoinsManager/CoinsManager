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
  # Create exchanges
  mtgoxId = Exchanges.insert {name: 'mtgox'}
  names = ['bitstamp', 'vircurex', 'btce', 'btcchina']
  Exchanges.insert {name: name} for name in names

  # Create fiats
  usdId = Fiats.insert {name: 'USD'}
  names = ['EUR', 'JPY', 'AUD']
  Fiats.insert {name: name} for name in names

  # Create CoinsManager user
  coinsManagerId = Meteor.users.insert
    userId: 1
    emails:
      address: Meteor.settings.public.email
    public:
      favorites:
        fiatId: usdId
        exchangeId: mtgoxId


  # Add public addresses for CoinsManager
  for crypto, address of Meteor.settings.public.donations
    Addresses.insert
      userId: coinsManagerId
      crypto: crypto
      address: address
