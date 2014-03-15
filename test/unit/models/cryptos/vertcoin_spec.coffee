describe "Vertcoin", ->

  beforeEach ->
    @data =
      address: "iMXPEVoAVfLHhMrP18PoCHKVSzgeV3vK9f"

  it "exists", ->
    Vertcoin.should.be.ok
    Vertcoin.should.be.an.Object

  it "has a code VTC", ->
    Vertcoin.should.have.a.property "code", "VTC"

  describe "verifyAddress", ->

    it "is a class method", ->
      Vertcoin.should.have.a.property "verifyAddress"
      Vertcoin.verifyAddress.should.be.a.Function

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
            Vertcoin.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "47"
      Vertcoin.verifyAddress(@data.address).should.eql false
