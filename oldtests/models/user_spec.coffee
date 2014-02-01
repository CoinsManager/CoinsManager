describe 'User', ->

  beforeEach ->
    defaultUser = new User
      email: 'default@example.com'

    customUser = new User
      username: 'Custom'
      email: 'custom@example.com'
      preferences:
        fiat: 'aud'
        exchanges: ['vircurex']
      wallets:
        btc:
          address: 16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5
          coins: 1.2

  it 'should have an email', ->
    defaultUser.should.have.a.property 'email' 'default@example.com'
    customUser.should.have.a.property 'email' 'custom@example.com'

  it 'can have an username', ->
    defaultUser.username.should.be.null
    defaultUser.getUsername().should.eql 'default@example.com'
    customUser.should.have.a.property 'username' 'Custom'

  it 'can have a fiat preference, default usd', ->
    defaultUser.preferences.fiat.should.be.null
    defaultUser.getFiat().should.eql 'usd'
    customUser.preferences.fiat.should.eql 'aud'

  it 'can have exchanges preference, default all', ->
    defaultUser.preferences.exchanges.should.be.null
    defaultUser.getExchanges().should.eql ExchangeManager.getAllExchanges()
    customUser.preferences.exchanges.should.eql ['vircurex']

  it 'can have coins wallets', ->
    defaultUser.wallets.should.be.empty
    customUser.wallets.should.have.deep.property 'btc.address'
    customUser.wallets.should.have.deep.property 'btc.coins' 1.2
