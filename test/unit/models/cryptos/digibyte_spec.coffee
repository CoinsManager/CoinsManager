describe "DigiByte", ->

  beforeEach ->
    @data =
      address: "iMXPEVoAVfLHhMrP18PoCHKVSzgeV3vK9f"

  it "exists", ->
    DigiByte.should.be.ok
    DigiByte.should.be.an.Object

  it "has a code DGC", ->
    DigiByte.should.have.a.property "code", "DGC"
