describe "FedoraCoin", ->

  beforeEach ->
    @data =
      address: "EKeraAhz78YYtwuC1KtKqmbmBDHk41owq1"

  it "exists", ->
    FedoraCoin.should.be.ok
    FedoraCoin.should.be.an.Object

  it "has a code TIPS", ->
    FedoraCoin.should.have.a.property "code", "TIPS"
