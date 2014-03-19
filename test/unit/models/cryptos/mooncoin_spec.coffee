describe "Mooncoin", ->

  beforeEach ->
    @data =
      address: "2aCoinsmYqFKWZzCQrAip7jpUzzvhLMAC2"

  it "exists", ->
    Mooncoin.should.be.ok
    Mooncoin.should.be.an.Object

  it "has a code MOON", ->
    Mooncoin.should.have.a.property "code", "MOON"
