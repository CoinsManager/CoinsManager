describe "Feathercoin", ->

  beforeEach ->
    @data =
      address: "6oUG8V5yJZ7PqFDZ8muMtBLJFWsAwZYXzL"

  it "exists", ->
    Feathercoin.should.be.ok
    Feathercoin.should.be.an.Object

  it "has a code FTC", ->
    Feathercoin.should.have.a.property "code", "FTC"

  describe "verify_address", ->

    it "is a class method", ->
      Feathercoin.should.have.a.property "verify_address"
      Feathercoin.verify_address.should.be.a.Function

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
            Feathercoin.verify_address address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Feathercoin.verify_address(@data.address).should.eql false
