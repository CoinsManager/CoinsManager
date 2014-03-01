Template.coinsManager.helpers
  sortedAddresses: ->
    if @donationAddresses
      addresses = @donationAddresses.sort (add1, add2) ->
        a = add1.get_value()
        b = add2.get_value()
        if not a? and not b?
          a = add1.get_balance()
          b = add2.get_balance()
        if not a?
          a = -1
        if not b?
          b = -1
        b - a
      return addresses


  loggedIn: ->
    Meteor.user()


Template.coinsManager.events
  "click #close_donation": (e) ->
    $("#donation_block").slideUp()
