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
    ["AUD", "BRL", "CAD", "CHF", "CNY", "EUR", "GBP", "ILS", "JPY", "NOK",
     "NZD", "PLN", "RUB", "SEK", "SGD", "TRY", "USD", "ZAR"]


Template.totalAsset.events
  "change select": (e, t) ->
    if Meteor.user()
      fiat = t.find("option:selected").value
      Meteor.call "setFiatPreference", fiat, (error, id) ->
        if error
          Errors.throw error.reason
