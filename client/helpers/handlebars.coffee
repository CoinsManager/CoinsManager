Handlebars.registerHelper 'arrayify', (obj) ->
    return {name:key, value:obj[key]} for key in obj


Handlebars.registerHelper 'get_balance', (crypto, address) ->
  Meteor.call "get_coin_balance", crypto, address, (error, result) ->
    # Get user
    user = Meteor.user() or Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    # Get favorite fiat
    #fiat = Fiats.findOne
      #_id: user.public.favorites.fiatId
    # Get favorite exchange
    # TODO: implement default "all"
    #exchange = Exchanges.findOne
      #_id: user.public.favorites.exchangeId
    #rate = exchange.get_btc_value()
    # TODO: Fix issue findOne is empty
    rate = 800

    balance = ".balance>." + address
    value = ".value>." + address
    if _.isNumber result
      $(balance).text result
      if crypto == 'btc'
        $(value).text rate * result
    else
      $(balance).text "This coin isn't yet supported"

    

