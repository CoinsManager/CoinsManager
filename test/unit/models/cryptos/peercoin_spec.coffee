describe "Peercoin", ->

  beforeEach ->
    @data =
      address: "PFUDQ8nFPTX3V9teUt3RQ9A1JU3niUYqdR"

  it "exists", ->
    Peercoin.should.be.ok
    Peercoin.should.be.an.Object

  it "has a code PPC", ->
    Peercoin.should.have.a.property "code", "PPC"

  describe "verify_address", ->

    it "is a class method", ->
      Peercoin.should.have.a.property "verify_address"
      Peercoin.verify_address.should.be.a.Function

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
            Peercoin.verify_address address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Peercoin.verify_address(@data.address).should.eql false
