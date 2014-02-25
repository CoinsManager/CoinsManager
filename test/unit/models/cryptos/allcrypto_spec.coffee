# TODO: Make fs available by rtd
#files = fs.readdirSync './app/models/cryptos/'
#classes = file.replace(".coffee.js", "") for file in files.filter (file) ->
  #file.search("(base_crypto*)|(js.map)") == -1
classes = [
  'Bitcoin',
  'Litecoin',
  'Earthcoin',
  'NobleCoin'
]

get_class = (name) ->
  @[name]


describe "Generic tests for all Cryptocurrencies", ->

  # TODO: fix test with fs.readdirSync
  it.skip "makes sure all implemented coins are tested", ->
    implementedCoins.sort().should.eql (
      key for key of cryptoClassesList).sort()

  for name in classes

    describe "Generic tests for #{name}", ->

      beforeEach ->
        coinClass = get_class(name)
        @coin = new coinClass 'Address'

      it "inherits BaseCrypto", ->
        @coin.should.be.an.instanceof BaseCrypto

      it "has a code", ->
        @coin.constructor.should.have.a.property "code"

      it "has a name", ->
        @coin.constructor.should.have.a.property "name"
        @coin.constructor.name.should.not.equal ""
