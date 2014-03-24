describe "GPUCoin", ->

  beforeEach ->
    @data =
      address: "GejRqHiAD86CvafbVEwzKnvspCdUjToUWj"

  it "exists", ->
    GPUCoin.should.be.ok
    GPUCoin.should.be.an.Object

  it "has a code GPU", ->
    GPUCoin.should.have.a.property "code", "GPU"
