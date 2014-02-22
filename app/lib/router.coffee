Router.configure
  layoutTemplate: "alphaLayout"
  #layoutTemplate: "comingSoonLayout"
  loadingTemplate: "loading"


Router.map ->
  #@route "comingSoon", path: "/", data: ->
      #do GAnalytics.pageview
  @route "alpha",
    path: "/",
    waitOn: ->
      collections = ["users", "donationAddresses"]
      Meteor.subscribe collection for collection in collections
      if Meteor.user()
        Meteor.subscribe "userAddresses", Meteor.user()._id
    data: ->
      coinsManager = Meteor.users.findOne
        "emails.address": "coinsmanager@gmail.com"
      if coinsManager
        addresses = Addresses.find
          userId: coinsManager._id
        addresses.observe ->
          changed: (doc, beforeIndex) ->
            console.log "addresses changed: #{doc.text}"
        donationAddresses: addresses.fetch().sort (add1, add2) ->
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
