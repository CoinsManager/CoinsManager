describe "AuroraCoin", ->

  beforeEach ->
    @data =
      address: "AZHMeBicRGGsj47wK9tobzumdo1G827vUf"

  it "exists", ->
    Auroracoin.should.be.ok
    Auroracoin.should.be.an.Object

  it "has a code AUR", ->
    Auroracoin.should.have.a.property "code", "AUR"
