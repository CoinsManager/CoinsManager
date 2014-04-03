describe "RubyCoin", ->

  beforeEach ->
    @data =
      address: "Rrq99KVUY5PattdAPpkzJepQYGLcjUhBbR"

  it "exists", ->
    RubyCoin.should.be.ok
    RubyCoin.should.be.an.Object

  it "has a code RUBY", ->
    RubyCoin.should.have.a.property "code", "RUBY"
