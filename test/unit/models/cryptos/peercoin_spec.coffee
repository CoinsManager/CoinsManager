describe "Peercoin", ->

  beforeEach ->
    @data =
      address: "PFUDQ8nFPTX3V9teUt3RQ9A1JU3niUYqdR"

  it "exists", ->
    Peercoin.should.be.ok
    Peercoin.should.be.an.Object

  it "has a code PPC", ->
    Peercoin.should.have.a.property "code", "PPC"
