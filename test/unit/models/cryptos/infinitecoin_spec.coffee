describe "Infinitecoin", ->

  beforeEach ->
    @data =
      address: "iMXPEVoAVfLHhMrP18PoCHKVSzgeV3vK9f"

  it "exists", ->
    Infinitecoin.should.be.ok
    Infinitecoin.should.be.an.Object

  it "has a code IFC", ->
    Infinitecoin.should.have.a.property "code", "IFC"

  describe "verifyAddress", ->

    it "is a class method", ->
      Infinitecoin.should.have.a.property "verifyAddress"
      Infinitecoin.verifyAddress.should.be.a.Function

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
            Infinitecoin.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Infinitecoin.verifyAddress(@data.address).should.eql false
