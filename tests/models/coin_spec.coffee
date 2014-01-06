{BaseCoin, Bitcoin} = require "#{__dirname}/../../models/coins"

describe 'BaseCoin', ->

  ##not working
  #beforeEach ->
    #@coin = new BaseCoin
      #name: "coin"

  it 'exists', ->
    BaseCoin.should.be.ok

describe 'Bitcoin', ->

  beforeEach ->
    @coin = new Bitcoin()
    this.coin = new Bitcoin()

  it 'should have a default name', ->
    coin = new Bitcoin
    console.log @coin
    console.log this.coin
    console.log coin
    coin.should.be.an.instanceOf BaseCoin
    coin.should.have.property 'name', 'Bitcoin'

  it 'should have an average value', ->
    coin = new Bitcoin
    coin.avg_value.should.eql 1000

  it 'should contain a list of exchanges', ->
    coin = new Bitcoin
    coin.should.have.property 'exchanges'

  #it 'should have a public address', ->
    #@coin.should.exist 'address'
