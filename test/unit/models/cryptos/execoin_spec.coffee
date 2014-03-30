describe "Execoin", ->

  beforeEach ->
    @data =
      address: "EgMiyNr5pwcARuRfkY4ygCKsKgH9X5kTCr"

  it "exists", ->
    Execoin.should.be.ok
    Execoin.should.be.an.Object

  it "has a code EXE", ->
    Execoin.should.have.a.property "code", "EXE"
