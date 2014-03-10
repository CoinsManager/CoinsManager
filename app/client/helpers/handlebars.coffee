"""
Helpers registered:

  * ifNumber
  * loggedIn
  * select
  * sortAddresses
  * truncateMiddle
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
