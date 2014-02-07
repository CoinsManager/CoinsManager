implementedCoins = [
  'BTC',
  'LTC',
  'EAC',
  'NOBL'
]


describe "Generic tests for all Cryptocurrencies", ->

  it "makes sure all implemented coins are tested", ->
    implementedCoins.sort().should.eql (
      key for key of cryptoClassesList).sort()

  for code in implementedCoins

    describe "Generic tests for #{code}", ->

      beforeEach ->
        @coin = cryptoClassesList[code]

      it "has a code", ->
        @coin.should.have.a.property "code"

      it "has a name", ->
        @coin.should.have.a.property "name"
        @coin.name.should.not.equal ""
