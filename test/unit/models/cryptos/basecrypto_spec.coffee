describe "BaseCrypto", ->

  beforeEach ->
    @coin = new BaseCrypto "Address"

  it "exists", ->
    BaseCrypto.should.be.ok
    @coin.address.should.equal "Address"

  it "has a method getBalance", ->
    @coin.should.have.a.property "getBalance"
    @coin.should.respondTo "getBalance"
    expect(@coin.getBalance()).to.be.undefined
    BaseCrypto.keys[@coin.name] = {}
    BaseCrypto.keys[@coin.name][@coin.address] =
      balance: 10
    @coin.getBalance().should.equal 10

  #it "has a method getValue", ->
    #@coin.getValue().should
      #.equal "Value calculation has not been implemented for BaseCrypto"

  it "has a method setBalance", ->
    Meteor.call = -> 'call_url'
    @coin.should.have.a.property "setBalance"
    @coin.should.respondTo "setBalance"
    @coin.setBalance().should.equal 'call_url'

  it "has a class method verifyAddress", ->
    BaseCrypto.should.have.a.property "verifyAddress"

    class TestCoin extends BaseCrypto

    TestCoin.verifyAddress("Address").should
      .equal "Verification for TestCoin has not been implemented yet"

