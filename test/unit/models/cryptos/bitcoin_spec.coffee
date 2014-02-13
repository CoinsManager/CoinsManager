describe "the Bitcoin model", ->

  beforeEach ->
    @data =
      address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

  it "exists", ->
    Bitcoin.should.be.ok
    Bitcoin.should.be.an.Object

  describe "verify_address", ->

    it "is a class method", ->
      Bitcoin.should.have.a.property "verify_address"
      Bitcoin.verify_address.should.be.a.Function

    errors =
      X5: "Address not base58"
      SZ: "Address not the correct size"
      CK: "Failed hash check"
      anythingElse: "An error occured"

    for error, reason of errors
      do (error, reason) ->
        it "can return an error '#{reason}'", ->
          address = @data.address
          Meteor.call = -> content: error

          (->
            Bitcoin.verify_address address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Bitcoin.verify_address(@data.address).should.eql false
