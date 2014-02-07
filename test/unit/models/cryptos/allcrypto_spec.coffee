describe "Generic tests for all Cryptocurrencies", ->

  it "allows us to test all coins automatically", ->
    for coin in cryptoClassesList

      describe "Generic tests for #{coin}",

        it "has a code", ->
          console.log coin.code
          coin.should.have.a.property "code"
