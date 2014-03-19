describe "Worldcoin", ->

  beforeEach ->
    @data =
      address: "WjxxAm7ChJh1T3DqrEyTWx6ThvkQJdPxPM"

  it "exists", ->
    Worldcoin.should.be.ok
    Worldcoin.should.be.an.Object

  it "has a code WDC", ->
    Worldcoin.should.have.a.property "code", "WDC"
