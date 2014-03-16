describe "Worldcoin", ->

  beforeEach ->
    @data =
      address: "WjxxAm7ChJh1T3DqrEyTWx6ThvkQJdPxPM"

  it "exists", ->
    Worldcoin.should.be.ok
    Worldcoin.should.be.an.Object

  it "has a code WDC", ->
    Worldcoin.should.have.a.property "code", "WDC"

  describe "verifyAddress", ->

    it "is a class method", ->
      Worldcoin.should.have.a.property "verifyAddress"
      Worldcoin.verifyAddress.should.be.a.Function

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
            Worldcoin.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "49"
      Worldcoin.verifyAddress(@data.address).should.eql false
