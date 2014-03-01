Router.configure
  layoutTemplate: "alphaLayout"
  loadingTemplate: "loading"


class CoinsManagerController extends RouteController
  data: ->
    do GAnalytics.pageview
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      addresses = Addresses.find
        userId: coinsManager._id
      fetchedAddresses = addresses.fetch()
      Session.set 'donationAddresses', fetchedAddresses
      return {donationAddresses: fetchedAddresses}


Router.map ->
  @route "alpha",
    path: "/"
    controller: CoinsManagerController
    waitOn: ->
      collections = ["users", "donationAddresses"]
      Meteor.subscribe collection for collection in collections
      if Meteor.user()
        Meteor.subscribe "userAddresses", Meteor.user()._id
