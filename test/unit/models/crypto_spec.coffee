

#describe 'BaseCrypto', ->

  #it 'exists', ->
    #BaseCrypto.should.be.ok


describe 'karma tests with chai', ->

  it 'should expose the Chai assert method', ->
    assert.ok 'everything', 'everything is ok'

  it 'should expose the Chai expect method', ->
    expect('foo').to.not.equal 'bar'

  it 'should expose the Chai should property', ->
    1.should.not.equal 2
    should.exist 123
