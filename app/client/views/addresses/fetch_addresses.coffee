Template.fetchAddresses.helpers
  websitesList: -> implementedWebsites


Template.fetchAddresses.events
  "click #close": (e) -> Session.set "showImportForm", false

  "submit form": (e) ->
    e.preventDefault()
    Errors.clearSeen()

    data =
      name: $(e.target).find(":selected").val()
      api_key: $(e.target).find("[name=api_key]").val()
      api_secret: $(e.target).find("[name=api_secret]").val()

    console.log "call fetchAddresses"
    Meteor.call "fetchAddresses", data, (error, id) ->
      if error
        Errors.throw error.reason
      else
        Session.set "showImportForm", false
