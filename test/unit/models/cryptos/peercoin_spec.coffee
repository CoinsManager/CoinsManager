describe "Peercoin", ->

  beforeEach ->
    @data =
      address: "PFUDQ8nFPTX3V9teUt3RQ9A1JU3niUYqdR"

  it "exists", ->
    Peercoin.should.be.ok
    Peercoin.should.be.an.Object

  it "has a code PPC", ->
    Peercoin.should.have.a.property "code", "PPC"

  describe "verifyAddress", ->

    it "is a class method", ->
      Peercoin.should.have.a.property "verifyAddress"
      Peercoin.verifyAddress.should.be.a.Function

    it "returns true if the address is correct", ->
      Meteor.call = ->
        data:
          data:
            is_valid: true
      Peercoin.verifyAddress(@data.address).should.be.false

    it "returns false if the address is correct", ->
      Meteor.call = ->
        data:
          data:
            is_valid: false
      address = @data.address
      (->
        Peercoin.verifyAddress address
      ).should.throw "Address incorrect"
