describe "Franko", ->

  beforeEach ->
    @data =
      address: "FUYNXUaLiKvjU2ZPc3xUgYKsFmeQxqcaez"

  it "exists", ->
    Franko.should.be.ok
    Franko.should.be.an.Object

  it "has a code FRK", ->
    Franko.should.have.a.property "code", "FRK"
