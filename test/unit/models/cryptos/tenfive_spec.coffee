describe "Tenfive", ->

  beforeEach ->
    @data =
      address: "Touw3JNTdTxRCzFyu622iog44GH54oY3ng"

  it "exists", ->
    Tenfive.should.be.ok
    Tenfive.should.be.an.Object

  it "has a code 10-5", ->
    Tenfive.should.have.a.property "code", "10-5"
