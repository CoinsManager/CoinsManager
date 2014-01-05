#{BaseCoin} = require '../collections/coins'

#Page = require "#{__dirname}/../models/page"

#describe 'Page', ->
  #it 'exists', ->
    #Page.should.be.ok
    #page = new Page
    #page.should.be.instanceOf Page


#describe 'BaseCoin', ->

  #beforeEach (done, server) ->
    #@coin = BaseCoins()

  #it 'should have a name', (done, server) ->
    #@coin.should.exist 'name'

  #it 'should have an average value', ->
    #@coin.should.exist 'avg_value'

  #it 'should contain a list of exchanges', ->
    #@coin.should.have.property 'exchanges'

  #it 'should have a public address', ->
    #@coin.should.exist 'address'


#describe 'Bitcoin', ->

  #beforeEach ->
    #@coin = new Bitcoin
      #name: 'bitcoin'
      #avg_value: 800

  #it 'should have a default name', ->
    #@coin.should.be.an.instanceOf(BaseCoin).and.have.property('name', 'bitcoin')
