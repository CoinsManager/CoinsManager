Handlebars.registerHelper 'ifNumber', (context, options) ->
  if _.isNumber context
    return options.fn this
  else
    return options.inverse this
