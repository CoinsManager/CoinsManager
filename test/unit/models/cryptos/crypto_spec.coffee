describe "BaseCrypto", ->

  beforeEach ->
    @coin = new BaseCrypto "A"

  it "exists", ->
    BaseCrypto.should.be.ok

  it "has a method get_balance", ->
    BaseCrypto
    @coin.should.have.a.property "get_balance"
    @coin.should.respondTo 'get_balance'
    @coin.get_balance().should.equal "Processing..."
    @coin.keys.balance = 10
    @coin.get_balance().should.equal 10

  it "has a method get_value", ->
    @coin.get_value().should
      .equal "Value calculation has not been implemented for "
