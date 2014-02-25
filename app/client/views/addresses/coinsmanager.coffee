Template.coinsManager.helpers
  sortedAddresses: ->
    if @donationAddresses
      @donationAddresses.sort (add1, add2) ->
        a = add1.get_value()
        b = add2.get_value()
        if not a and not b
          a = add1.get_balance()
          b = add2.get_balance()
        if not _.isNumber a
          a = -1
        if not _.isNumber b
          b = -1
        b - a

  loggedIn: ->
    Meteor.user()


Template.coinsManager.events
  "click #close_donation": (e) ->
    $("#donation_block").slideUp()

