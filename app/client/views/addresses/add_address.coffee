Template.addAddress.created = ->
  Session.set "coinsList", false
  Session.set "showCompleteForm", false
  Session.set "showCoinHelp", false


Template.addAddress.helpers
  coinsList: ->
    Session.get "coinsList"
  coinRecognized: ->
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
        if result.length > 1 and not Session.get "coinsList"
          Session.set "coinsList", result
          return
        else if result.length is 0 and not Session.get "showCompleteForm"
          Session.set "showCompleteForm", true
          return

        data =
          address: address
          name: $(e.target).find(":selected").val() or
                $(e.target).find("[name=name]").val()
          code: $(e.target).find("[name=code]").val()
          nb_coin: $(e.target).find("[name=nb_coin]").val()
          value: $(e.target).find("[name=value]").val()

        Meteor.call "addAddress", data, (error, id) ->
          if error
            # Display the error
            Errors.throw error.reason
          else
            for variable in ["showCoinForm", "showCompleteForm",
                         "showCoinHelp", "coinsList"]
              Session.set variable, false

  "click .fa-plus-square": (e) ->
    Session.set "showCompleteForm", true
    Session.set "coinsList", false

  "click #close-form": (e) ->
    Session.set "showCompleteForm", false

  "click .fa-question-circle": (e) ->
    Session.set "showCoinHelp", true

  "click #close-coin-help": (e) ->
    Session.set "showCoinHelp", false

  "click #close": (e) ->
    Session.set "showCoinForm", false
