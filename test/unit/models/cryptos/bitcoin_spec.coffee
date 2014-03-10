describe "the Bitcoin model", ->

  beforeEach ->
    @data =
      address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

  it "exists", ->
    Bitcoin.should.be.ok
    Bitcoin.should.be.an.Object

  it "has a code BTC", ->
    Bitcoin.should.have.a.property "code", "BTC"

  describe "verifyAddress", ->

    it "is a class method", ->
      Bitcoin.should.have.a.property "verifyAddress"
      Bitcoin.verifyAddress.should.be.a.Function

    errors =
      X5: "Address not base58"
      SZ: "Address not the correct size"
      CK: "Failed hash check"

    for error, reason of errors
      do (error, reason) ->
        it "can return an error '#{reason}'", ->
          address = @data.address
          Meteor.call = -> content: error

          (->
            Bitcoin.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Bitcoin.verifyAddress(@data.address).should.eql false
