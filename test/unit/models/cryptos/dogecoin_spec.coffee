describe "Dogecoin", ->

  beforeEach ->
    @data =
      address: "DCMWPxrhrj12RhvqXTsT1NeM9TLYutdwV2"

  it "exists", ->
    Dogecoin.should.be.ok
    Dogecoin.should.be.an.Object

  it "has a code DOGE", ->
    Dogecoin.should.have.a.property "code", "DOGE"
