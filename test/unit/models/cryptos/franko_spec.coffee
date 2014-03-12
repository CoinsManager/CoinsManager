describe "Franko", ->

  beforeEach ->
    @data =
      address: "FUYNXUaLiKvjU2ZPc3xUgYKsFmeQxqcaez"

  it "exists", ->
    Franko.should.be.ok
    Franko.should.be.an.Object

  it "has a code FRK", ->
    Franko.should.have.a.property "code", "FRK"

  describe "verifyAddress", ->

    it "is a class method", ->
      Franko.should.have.a.property "verifyAddress"
      Franko.verifyAddress.should.be.a.Function

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
            Franko.verifyAddress address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "23"
      Franko.verifyAddress(@data.address).should.eql false
