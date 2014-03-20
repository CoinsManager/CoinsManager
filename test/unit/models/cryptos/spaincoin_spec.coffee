describe "SpainCoin", ->

  beforeEach ->
    @data =
      address: "Skaw9nXpnFiq3oX5ATPfhkf38JFrDhSnBu"

  it "exists", ->
    Spaincoin.should.be.ok
    Spaincoin.should.be.an.Object

  it "has a code SPA", ->
    Spaincoin.should.have.a.property "code", "SPA"
