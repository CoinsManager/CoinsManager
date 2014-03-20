describe "Digitalcoin", ->

  beforeEach ->
    @data =
      address: "EKeraAhz78YYtwuC1KtKqmbmBDHk41owq1"

  it "exists", ->
    Digitalcoin.should.be.ok
    Digitalcoin.should.be.an.Object

  it "has a code TIPS", ->
    Digitalcoin.should.have.a.property "code", "DGC"
