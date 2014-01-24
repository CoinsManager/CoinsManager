Handlebars.registerHelper 'arrayify', (obj) ->
    console.log "TEEEST : " + obj
    return {name:key, value:obj[key]} for key in obj


Handlebars.registerHelper 'check_bitcoin', (address) ->
  Meteor.call "check_bitcoin", address, (error, result) ->
    $("#" + address).text result.data.final_balance / 100000000

