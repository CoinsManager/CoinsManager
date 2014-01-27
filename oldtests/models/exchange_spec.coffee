describe 'BaseExchange', ->

  it 'exists', ->
    BaseExchange.should.be.ok


describe 'Exchanges', ->

  describe 'Mt.Gox', ->

    beforeEach ->
      exchange = new MtGox()

    it 'should have a name', ->
      exchange.should.be.an.instanceOf BaseExchange
      exchange.should.have.a.property 'name', 'Mt.Gox'

    it 'should have a list of supported CryptoCurrencies', ->
      exchange.should.have.a.property 'supportedCurrencies'
      exchange.supportedCurrencies.should.be.an 'object'

    it 'should support Bitcoin', ->
      exchange.supportedCurrencies.should.contain('bitcoin')
