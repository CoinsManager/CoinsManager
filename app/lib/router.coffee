Router.configure
  layoutTemplate: "alphaLayout"
  loadingTemplate: "loading"


class CoinsManagerController extends RouteController
  data: ->
    do GAnalytics.pageview
    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"
    if coinsManager
      donationAddresses = Addresses.find
        userId: coinsManager._id
      userAddresses = Addresses.find
        userId: Meteor.user()._id
      allAddresses = Addresses.find
        $or: [
          {userId: coinsManager._id}
          {userId: Meteor.user()._id}
        ]
      Session.set 'allAddresses', allAddresses.fetch()
      return {
        donationAddresses: donationAddresses.fetch()
        userAddresses: userAddresses
      }


Router.map ->
  @route "alpha",
    path: "/"
    controller: CoinsManagerController
    waitOn: ->
      collections = ["users", "donationAddresses"]
      Meteor.subscribe collection for collection in collections
      if Meteor.user()
        Meteor.subscribe "userAddresses", Meteor.user()._id
