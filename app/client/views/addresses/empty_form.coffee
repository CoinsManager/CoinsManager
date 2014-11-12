Template.emptyForm.events
  "click .is_inactive": (e) ->
    Session.set "showCoinForm", true


Template.emptyImportForm.events
  "click .is_inactive": (e) ->
    Session.set "showImportForm", true
