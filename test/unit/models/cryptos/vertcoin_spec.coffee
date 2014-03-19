describe "Vertcoin", ->

  beforeEach ->
    @data =
      address: "iMXPEVoAVfLHhMrP18PoCHKVSzgeV3vK9f"

  it "exists", ->
    Vertcoin.should.be.ok
    Vertcoin.should.be.an.Object

  it "has a code VTC", ->
    Vertcoin.should.have.a.property "code", "VTC"
