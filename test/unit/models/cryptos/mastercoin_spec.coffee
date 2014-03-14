describe "the Mastercoin model", ->

  beforeEach ->
    @data =
      address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

  it "exists", ->
    Mastercoin.should.be.ok
    Mastercoin.should.be.an.Object

  it "has a code MSC", ->
    Mastercoin.should.have.a.property "code", "MSC"

  describe "verifyAddress", ->

    it "is a class method", ->
      Mastercoin.should.have.a.property "verifyAddress"
      Mastercoin.verifyAddress.should.be.a.Function

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
            Mastercoin.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Mastercoin.verifyAddress(@data.address).should.eql false
