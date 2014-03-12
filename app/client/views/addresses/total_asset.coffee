Template.totalAsset.helpers
  totalValue: ->
    sum = 0
    for address in @
      value = address.get_value()
      if value?
        sum += +value
    return sum.toFixed 2

  fiatList: ->
    #TODO: Implement following, client synchronous http call
    #url = "https://api.bitcoinaverage.com/ticker/"
    #fiatList = Meteor.call "callUrl", url
    #fiat for fiat of fiatList when fiat isnt "all"
    [
      {code: "AUD", name: "Australian Dollar"}
      {code: "BRL", name: "Brazilian Real"}
      {code: "CAD", name: "Canadian Dollar"}
      {code: "CHF", name: "Swiss Franc"}
      {code: "CNY", name: "Chinese Yuan Renminbi"}
      {code: "EUR", name: "Euro"}
      {code: "GBP", name: "Pound sterling"}
      {code: "ILS", name: "Israeli Shekel"}
      {code: "JPY", name: "Japanese Yen"}
      {code: "NOK", name: "Norwegian Krone"}

      {code: "NZD", name: "New Zealand Dollar"}
      {code: "PLN", name: "Polish Zloty"}
      {code: "RUB", name: "Russian Ruble"}
      {code: "SEK", name: "Swedish Krona"}
      {code: "SGD", name: "Singapore Dollar"}
      {code: "TRY", name: "Turkish Lira"}
      {code: "USD", name: "US Dollar"}
      {code: "ZAR", name: "South African Rand"}
    ]


Template.totalAsset.events
  "change select": (e, t) ->
    if Meteor.user()
      fiat = t.find("option:selected").value
      Meteor.call "setFiatPreference", fiat, (error, id) ->
        if error
          Errors.throw error.reason
