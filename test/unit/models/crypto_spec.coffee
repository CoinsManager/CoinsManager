#{BaseCrypto} = require "#{__dirname}/../../models/base_coins"

describe 'BaseCrypto', ->

  it 'exists', ->
    #BaseCrypto.should.be.ok
    expect(BaseCrypto).toBe 1
