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

    it "returns true if the address is correct", ->
      Meteor.call = ->
        data:
          data:
            is_valid: true
      Peercoin.verify_address(@data.address).should.be.false

    it "returns false if the address is correct", ->
      Meteor.call = ->
        data:
          data:
            is_valid: false
      address = @data.address
      (->
        Peercoin.verify_address address
      ).should.throw "Address incorrect"
