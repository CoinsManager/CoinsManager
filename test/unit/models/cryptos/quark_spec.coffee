describe "Quark", ->

  beforeEach ->
    @data =
      address: "QNR3bvzeU5ahMAXpYuubPEHjnUEpMe7SJz"

  it "exists", ->
    Quark.should.be.ok
    Quark.should.be.an.Object

  it "has a code QRK", ->
    Quark.should.have.a.property "code", "QRK"
