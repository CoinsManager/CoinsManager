{BaseCrypto} = require "#{__dirname}/../../models/base_coins"
{Bitcoin} = require "#{__dirname}/../../models/bitcoin"


describe 'BaseCrypto', ->

  it 'exists', ->
    BaseCrypto.should.be.ok


describe 'CryptoCurrencies', ->

  coin = false

  describe 'Bitcoin', ->

    beforeEach ->
      coin = new Bitcoin()

    it 'should have a default name', ->
      coin.should.be.an.instanceOf BaseCrypto
      coin.should.have.a.property 'name', 'Bitcoin'

    it 'should have an average value', ->
      coin.avg_value.should.eql 1000

    it 'should contain a list of exchanges', ->
      coin.should.have.a.property 'exchanges'

    #it 'should have a public address', ->
      #@coin.should.exist 'address'
