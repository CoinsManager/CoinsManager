Handlebars.registerHelper 'arrayify', (obj) ->
    console.log "TEEEST : " + obj
    return {name:key, value:obj[key]} for key in obj


Handlebars.registerHelper 'get_coin_balance', (crypto, address) ->
  Meteor.call "get_coin_balance", crypto, address, (error, result) ->
    if _.isNumber result
      $("#" + address).text result
    else
      $("#" + address).text "This coin isn't yet supported"

