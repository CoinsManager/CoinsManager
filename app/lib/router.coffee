Router.configure
  layoutTemplate: "alphaLayout"
  #layoutTemplate: "comingSoonLayout"
  loadingTemplate: "loading"


class CoinsManagerController extends RouteController
  template: "coinsManager"
  data: ->
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find
        userId: coinsManager._id
      return {donationAddresses: addresses}


Router.map ->
  #@route "comingSoon", path: "/", data: ->
      #do GAnalytics.pageview
  @route "alpha",
    path: "/"
    controller: CoinsManagerController
    waitOn: ->
      collections = ["users", "donationAddresses"]
      Meteor.subscribe collection for collection in collections
      if Meteor.user()
        Meteor.subscribe "userAddresses", Meteor.user()._id

