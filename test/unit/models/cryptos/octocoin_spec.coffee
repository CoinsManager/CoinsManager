describe "Octocoin", ->

  beforeEach ->
    @data =
      address: "8..."  # Cannot build wallet

  it "exists", ->
    Octocoin.should.be.ok
    Octocoin.should.be.an.Object

  it "has a code 888", ->
    Octocoin.should.have.a.property "code", "888"
