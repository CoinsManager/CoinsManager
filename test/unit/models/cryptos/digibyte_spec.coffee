describe "DigiByte", ->

  beforeEach ->
    @data =
      address: "DCoinsMBp9SZnNrJToJJ1jSJB3yDfSCw7t"

  it "exists", ->
    DigiByte.should.be.ok
    DigiByte.should.be.an.Object

  it "has a code DGB", ->
    DigiByte.should.have.a.property "code", "DGB"
