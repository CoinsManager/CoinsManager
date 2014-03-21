Template.fetchAddresses.events
  "click #close": (e) ->
    Session.set "showImportForm", false


Template.fetchAddresses.events
  "submit form": (e) ->
    e.preventDefault()
    Errors.clearSeen()

    name = $(e.target).find(":selected").val()
    alert "TODO! integrate #{name}"
