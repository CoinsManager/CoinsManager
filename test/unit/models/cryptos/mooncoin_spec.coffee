describe "Mooncoin", ->

  beforeEach ->
    @data =
      address: "2aCoinsmYqFKWZzCQrAip7jpUzzvhLMAC2"

  it "exists", ->
    Mooncoin.should.be.ok
    Mooncoin.should.be.an.Object

  it "has a code MOON", ->
    Mooncoin.should.have.a.property "code", "MOON"

  describe "verify_address", ->

    it "is a class method", ->
      Mooncoin.should.have.a.property "verify_address"
      Mooncoin.verify_address.should.be.a.Function

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
            Mooncoin.verify_address address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Mooncoin.verify_address(@data.address).should.eql false
