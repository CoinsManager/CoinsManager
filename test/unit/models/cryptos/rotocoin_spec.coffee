describe "RotoCoin", ->

  beforeEach ->
    @data =
      address: "GejRqHiAD86CvafbVEwzKnvspCdUjToUWj"

  it "exists", ->
    RotoCoin.should.be.ok
    RotoCoin.should.be.an.Object

  it "has a code ROTO", ->
    RotoCoin.should.have.a.property "code", "ROTO"
