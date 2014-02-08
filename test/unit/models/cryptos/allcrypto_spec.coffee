implementedCoins = [
  'BTC',
  'LTC',
  'EAC',
  'NOBL'
]
files = fs.readdirSync '../../../../app/models/cryptos/'
console.log files


describe "Generic tests for all Cryptocurrencies", ->

  it "makes sure all implemented coins are tested", ->
    implementedCoins.sort().should.eql (
      key for key of cryptoClassesList).sort()

  for code in implementedCoins

    describe "Generic tests for #{code}", ->

      beforeEach ->
        @coin = new cryptoClassesList[code] 'Address'

      it "inherits BaseCrypto", ->
        @coin.should.be.an.instanceof BaseCrypto

      it "has a code", ->
        @coin.constructor.should.have.a.property "code"

      it "has a name", ->
        @coin.constructor.should.have.a.property "name"
        @coin.constructor.name.should.not.equal ""
