describe "RotoCoin", ->

  beforeEach ->
    @data =
      address: "RpkqKhxnws1v2PBUusaD5kR3fHamhMC39J"

  it "exists", ->
    RotoCoin.should.be.ok
    RotoCoin.should.be.an.Object

  it "has a code RT2", ->
    RotoCoin.should.have.a.property "code", "RT2"
