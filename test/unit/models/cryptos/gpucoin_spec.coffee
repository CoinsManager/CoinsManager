describe "GPUCoin", ->

  beforeEach ->
    @data =
      address: ""

  it "exists", ->
    GPUCoin.should.be.ok
    GPUCoin.should.be.an.Object

  it "has a code GPUC", ->
    GPUCoin.should.have.a.property "code", "GPUC"
