describe "Rubycoin", ->

  beforeEach ->
    @data =
      address: "Rrq99KVUY5PattdAPpkzJepQYGLcjUhBbR"

  it "exists", ->
    Rubycoin.should.be.ok
    Rubycoin.should.be.an.Object

  it "has a code RUBY", ->
    Rubycoin.should.have.a.property "code", "RUBY"
