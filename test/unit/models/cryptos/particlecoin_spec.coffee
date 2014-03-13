describe "Particle", ->

  beforeEach ->
    @data =
      address: "PcoinsM7kZW68uqdA3QMDAvk28ySktkkdF"

  it "exists", ->
    Particle.should.be.ok
    Particle.should.be.an.Object

  it "has a code PRT", ->
    Particle.should.have.a.property "code", "PRT"

  describe "verifyAddress", ->

    it "is a class method", ->
      Particle.should.have.a.property "verifyAddress"
      Particle.verifyAddress.should.be.a.Function

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
            Particle.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "38"
      Particle.verifyAddress(@data.address).should.eql false
