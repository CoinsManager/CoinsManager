describe "GreeceCoin", ->

  beforeEach ->
    @data =
      address: "GMgj9BLAamvqVQP7Pf4QXwaj7oyP5CdXLx"

  it "exists", ->
    GreeceCoin.should.be.ok
    GreeceCoin.should.be.an.Object

  it "has a code GRCE", ->
    GreeceCoin.should.have.a.property "code", "GRCE"
