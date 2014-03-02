Router.configure
  layoutTemplate: "alphaLayout"
  loadingTemplate: "loading"


class CoinsManagerController extends RouteController
  data: ->
    do GAnalytics.pageview

    coinsManager = Meteor.users.findOne
      "emails.address": "coinsmanager@gmail.com"

    if coinsManager
      donationAddresses = []
      userAddresses = []
      allAddresses = []
      result = []

      donationAddresses = Addresses.find
        userId: coinsManager._id
      user = Meteor.user()
      if user
        userAddresses = Addresses.find
          userId: Meteor.user()._id

      if coinsManager and user
        allAddresses = Addresses.find
          $or: [
            {userId: coinsManager._id}
            {userId: Meteor.user()._id}
          ]
        result =
          donationAddresses: donationAddresses.fetch()
          userAddresses: userAddresses.fetch()
        Session.set 'ShowDonationAddresses', false
      else
        allAddresses = _.clone donationAddresses
        result =
          donationAddresses: donationAddresses.fetch()
        Session.set 'ShowDonationAddresses', true

      Session.set 'allAddresses', allAddresses.fetch()
      return result


Router.map ->
  @route "alpha",
    path: "/"
    controller: CoinsManagerController
    waitOn: ->
      collections = ["users", "donationAddresses"]
      Meteor.subscribe collection for collection in collections
      if Meteor.user()
        Meteor.subscribe "userAddresses", Meteor.user()._id
