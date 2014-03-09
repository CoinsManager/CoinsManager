describe "Quark", ->

  beforeEach ->
    @data =
      address: "QNR3bvzeU5ahMAXpYuubPEHjnUEpMe7SJz"

  it "exists", ->
    Quark.should.be.ok
    Quark.should.be.an.Object

  it "has a code QRK", ->
    Quark.should.have.a.property "code", "QRK"

  describe "verify_address", ->

    it "is a class method", ->
      Quark.should.have.a.property "verify_address"
      Quark.verify_address.should.be.a.Function

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
            Quark.verify_address address
          ).should.throw reason

    it "returns false if the address is correct", ->
      Meteor.call = ->
        content: "00"
      Quark.verify_address(@data.address).should.eql false
