Handlebars.registerHelper 'ifNumber', (context, options) ->
  if _.isNumber context
    return options.fn this
  else
    return options.inverse this

Handlebars.registerHelper 'truncateMiddle', (fullStr, strLen) ->
  if fullStr.length > strLen
    separator = '...'
    sepLen = separator.length
    charsToShow = strLen - sepLen
    frontChars = Math.ceil charsToShow/2
    backChars = Math.floor charsToShow/2
    result = fullStr.substr(0, frontChars) + separator +
      fullStr.substr(fullStr.length - backChars)
  else
    fullStr