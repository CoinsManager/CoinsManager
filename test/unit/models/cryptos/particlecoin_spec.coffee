describe "Particle", ->

  beforeEach ->
    @data =
      address: "PcoinsM7kZW68uqdA3QMDAvk28ySktkkdF"

  it "exists", ->
    Particle.should.be.ok
    Particle.should.be.an.Object

  it "has a code PRT", ->
    Particle.should.have.a.property "code", "PRT"
