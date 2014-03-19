describe "the Mastercoin model", ->

  beforeEach ->
    @data =
      address: "16sVbwiEZo47CSdvc7utB1g5X7fd2CWtc5"

  it "exists", ->
    Mastercoin.should.be.ok
    Mastercoin.should.be.an.Object

  it "has a code MSC", ->
    Mastercoin.should.have.a.property "code", "MSC"
