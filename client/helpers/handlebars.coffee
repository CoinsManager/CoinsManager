Handlebars.registerHelper
  arrayify: (obj) ->
    console.log "TEEEST : " + obj
    return {name:key, value:obj[key]} for key in obj
