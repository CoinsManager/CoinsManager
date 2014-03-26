describe "Greececoin", ->

  beforeEach ->
    @data =
      address: "GMgj9BLAamvqVQP7Pf4QXwaj7oyP5CdXLx"

  it "exists", ->
    Greececoin.should.be.ok
    Greececoin.should.be.an.Object

  it "has a code GRCE", ->
    Greececoin.should.have.a.property "code", "GRCE"
