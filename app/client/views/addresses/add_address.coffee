Template.addAddress.created = ->
  Session.set "showCompleteForm", false
  Session.set "showCoinHelp", false


Template.addAddress.helpers
  coinsList: ->
    Session.get "coinsList"
  coin_recognized: ->
    not Session.get "showCompleteForm"
  coin_help: ->
    Session.get "showCoinHelp"


Template.addAddress.events
  "submit form": (e) ->
    e.preventDefault()
    address = $(e.target).find("[name=address]").val()

    Meteor.call "verifyAddress", address, (error, result) ->
      if error
        Errors.throw error.reason
      else
        if result.length is 1
          data =
            address: address
            name: result[0]
            code: $(e.target).find("[name=code]").val()
            nb_coin: $(e.target).find("[name=nb_coin]").val()
            value: $(e.target).find("[name=value]").val()

          Meteor.call "addAddress", data, (error, id) ->
            if error
              # Display the error
              Errors.throw error.reason
            else
              for text in ["showCoinForm", "showCompleteForm",
                           "showCoinHelp", "coinsList"]
                Session.set text, false
        else
          Session.set "coinsList", result

  "click .fa-plus-square": (e) ->
    Session.set "showCompleteForm", true

  "click #close-form": (e) ->
    Session.set "showCompleteForm", false

  "click .fa-question-circle": (e) ->
    Session.set "showCoinHelp", true

  "click #close-coin-help": (e) ->
    Session.set "showCoinHelp", false

  "click #close": (e) ->
    Session.set "showCoinForm", false
