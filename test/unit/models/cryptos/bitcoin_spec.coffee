describe "the Bitcoin model", ->

  beforeEach ->
    @data =
      address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

  it "exists", ->
    Bitcoin.should.be.ok
    Bitcoin.should.be.an.Object

  #it "is in the cryptoClassesList list", ->
    #cryptoClassesList.should.have.key 'BTC'
    #cryptoClassesList.BTC.should.eql Bitcoin
    #cryptoClassesList.should.containEql
      #'BTC': Bitcoin

  describe "verify_address", ->

    it "is a class method", ->
      Bitcoin.should.have.a.property "verify_address"
      Bitcoin.verify_address.should.be.a.Function

    it "returns a 601 error if address is not base58", ->
      test = (address) ->
        throw new Error 'test'
      test(@data.address).should.throw 'test'

      Meteor.call = ->
        "X5"
      Bitcoin.verify_address(@data.address).should.throw "Address not base58"
