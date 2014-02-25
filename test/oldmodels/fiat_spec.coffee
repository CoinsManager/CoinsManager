describe 'BaseFiat', ->

  it 'exists', ->
    BaseFiat.should.be.ok


describe 'Fiat Currencies', ->

  describe 'USD', ->

    beforeEach ->
      dollar = new USD()

    it 'should have a name', ->
      dollar.should.be.an.instanceOf BaseFiat
      dollar.should.have.a.property 'name', 'US Dollar'

    it 'should always have a value of 1', ->
      dollar.value.should.eql 1
