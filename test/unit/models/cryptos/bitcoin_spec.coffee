describe "the Bitcoin model", ->

  beforeEach ->
    @data =
      address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

  it "exists", ->
    Bitcoin.should.be.ok
    Bitcoin.should.be.an.Object

  it "has a code BTC", ->
    Bitcoin.should.have.a.property "code", "BTC"
