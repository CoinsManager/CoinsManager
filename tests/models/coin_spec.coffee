{BaseCoin, Bitcoin} = require "#{__dirname}/../../models/coins"

describe 'BaseCoin', ->

  ##not working
  #beforeEach ->
    #@coin = new BaseCoin
      #name: "coin"

  it 'exists', ->
    BaseCoin.should.be.ok

describe 'Coins', () ->

  coin = false

  beforeEach ->
    coin = new Bitcoin()

  it 'should have a default name', ->
    coin.should.be.an.instanceOf BaseCoin
    coin.should.have.property 'name', 'Bitcoin'

  it 'should have an average value', ->
    coin.avg_value.should.eql 1000

  it 'should contain a list of exchanges', ->
    coin.should.have.property 'exchanges'

  #it 'should have a public address', ->
    #@coin.should.exist 'address'
