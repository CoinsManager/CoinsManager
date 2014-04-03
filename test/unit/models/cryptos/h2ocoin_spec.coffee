describe "H2Ocoin", ->

  beforeEach ->
    @data =
      address: "HFvgYhmMXjaeteav6A8uT5R4C6v4vTFURd"

  it "exists", ->
    H2Ocoin.should.be.ok
    H2Ocoin.should.be.an.Object

  it "has a code H2O", ->
    H2Ocoin.should.have.a.property "code", "H2O"
