describe "ExeCoin", ->

  beforeEach ->
    @data =
      address: "EgMiyNr5pwcARuRfkY4ygCKsKgH9X5kTCr"

  it "exists", ->
    ExeCoin.should.be.ok
    ExeCoin.should.be.an.Object

  it "has a code EXE", ->
    ExeCoin.should.have.a.property "code", "EXE"
