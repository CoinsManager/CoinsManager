"""
Helpers registered:

  * ifNumber
  * loggedIn
  * select
  * sortAddresses
  * truncateMiddle
  * userFiat
"""

Handlebars.registerHelper "ifNumber", (context, options) ->
  if _.isNumber context
    return options.fn this
  else
    return options.inverse this


Handlebars.registerHelper "loggedIn", ->
  Meteor.user()


Handlebars.registerHelper "select", (value, options) ->
  $el = $("<select />").html options.fn(this)
  $el.find("[value=#{value}]").attr
    selected: "selected"
  $el.html()

Handlebars.registerHelper "setActiveFiatList", (value, options) ->
  $el = $("<ul.fiat-list />").html options.fn(this)
  $el.find("[data-value=#{value}]").addClass "is_active"
  $el.html()

Handlebars.registerHelper "sortAddresses", (addresses, options) ->
  if addresses and addresses.length
    sortedAddresses = addresses.sort (add1, add2) ->
      a = add1.get_value()
      b = add2.get_value()
      if not a? and not b?
        a = add1.get_balance()
        b = add2.get_balance()
      if not a?
        a = -1
      if not b?
        b = -1
      b - a
    return sortedAddresses


Handlebars.registerHelper "truncateMiddle", (fullStr, strLen) ->
  if fullStr.length > strLen
    separator = "..."
    sepLen = separator.length
    charsToShow = strLen - sepLen
    frontChars = Math.ceil charsToShow/2
    backChars = Math.floor charsToShow/2
    result = fullStr.substr(0, frontChars) + separator +
      fullStr.substr(fullStr.length - backChars)
  else
    result = fullStr
  return result


Handlebars.registerHelper "userFiat", ->
  user = Meteor.user()
  if user and "fiat" of user
    user.fiat

Handlebars.registerHelper  "totalValue", ->
    sum = 0
    for address in @
      value = address.get_value()
      if value?
        sum += +value
    return sum.toFixed 2

Handlebars.registerHelper  "fiatList", ->
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
      {code: "GBP", name: "Pound Sterling"}
      {code: "ILS", name: "Israeli New Shekel"}
      {code: "JPY", name: "Japanese Yen"}
      {code: "NOK", name: "Norwegian Krone"}

      {code: "NZD", name: "New Zealand Dollar"}
      {code: "PLN", name: "Polish Zloty"}
      {code: "RUB", name: "Russian Ruble"}
      {code: "SEK", name: "Swedish Krona"}
      {code: "SGD", name: "Singapore Dollar"}
      {code: "TRY", name: "Turkish Lira"}
      {code: "USD", name: "United States Dollar"}
      {code: "ZAR", name: "South African Rand"}
    ]