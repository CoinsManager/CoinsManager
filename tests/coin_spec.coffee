describe 'BaseCoin', ->

  beforeEach ->
    @coin = new BaseCoin()

  it 'should have a name', ->
    @coin.should.exist 'name'

  it 'should have an average value', ->
    @coin.should.exist 'avg_value'

  it 'should contain a list of exchanges', ->
    @coin.should.have.property 'exchanges'

  it 'should have a public address', ->
    @coin.should.exist 'address'


describe 'Bitcoin', ->

  beforeEach ->
    @coin = new Bitcoin()

  it 'should have a default name', ->
    user.should.be.an.instanceOf(BaseCoin).and.have.property('name', 'bitcoin')
