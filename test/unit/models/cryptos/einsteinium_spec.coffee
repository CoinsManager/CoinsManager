describe "Einsteinium", ->

  beforeEach ->
    @data =
      address: "EPw2CG9C5KZ3siR31sqFeHaUpLhKcNUbDh"

  it "exists", ->
    Einsteinium.should.be.ok
    Einsteinium.should.be.an.Object

  it "has a code EMC2", ->
    Einsteinium.should.have.a.property "code", "EMC2"
