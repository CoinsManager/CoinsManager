describe "BaseCrypto", ->

  beforeEach ->
    @coin = new BaseCrypto "Address"

  it "exists", ->
    BaseCrypto.should.be.ok
    @coin.address.should.equal "Address"

  it "has a method get_balance", ->
    @coin.should.have.a.property "get_balance"
    @coin.should.respondTo "get_balance"
    @coin.get_balance().should.equal "Processing..."
    @coin.keys.balance = 10
    @coin.get_balance().should.equal 10

  it "has a method get_value", ->
    @coin.get_value().should
      .equal "Value calculation has not been implemented for BaseCrypto"

  it "has a method set_balance", ->
    Meteor.call = -> 'call_url'
    @coin.should.have.a.property "set_balance"
    @coin.should.respondTo "set_balance"
    @coin.set_balance().should.equal 'call_url'

  it "has a class method verify_address", ->
    BaseCrypto.should.have.a.property "verify_address"

    class TestCoin extends BaseCrypto

    TestCoin.verify_address("Address").should
      .equal "Verification for TestCoin has not been implemented yet"

