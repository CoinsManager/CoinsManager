describe "Infinitecoin", ->

  beforeEach ->
    @data =
      address: "iMXPEVoAVfLHhMrP18PoCHKVSzgeV3vK9f"

  it "exists", ->
    Infinitecoin.should.be.ok
    Infinitecoin.should.be.an.Object

  it "has a code IFC", ->
    Infinitecoin.should.have.a.property "code", "IFC"
