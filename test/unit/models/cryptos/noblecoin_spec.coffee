describe "NobleCoin", ->

  beforeEach ->
    @data =
      address: "9m92Xja31Fa9wMooFrVHrUmY79sHa3rJG9"

  it "exists", ->
    NobleCoin.should.be.ok
    NobleCoin.should.be.an.Object

  it "has a code NOBL", ->
    NobleCoin.should.have.a.property "code", "NOBL"
