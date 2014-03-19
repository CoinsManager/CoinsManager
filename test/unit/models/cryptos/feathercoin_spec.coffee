describe "Feathercoin", ->

  beforeEach ->
    @data =
      address: "6oUG8V5yJZ7PqFDZ8muMtBLJFWsAwZYXzL"

  it "exists", ->
    Feathercoin.should.be.ok
    Feathercoin.should.be.an.Object

  it "has a code FTC", ->
    Feathercoin.should.have.a.property "code", "FTC"
